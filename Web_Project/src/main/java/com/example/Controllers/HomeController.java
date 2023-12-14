package com.example.Controllers;

import com.example.Entity.User;
import com.example.Repositories.UserRepository;
import com.example.Services.FirebaseStorageService;
import com.example.Services.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("")
public class HomeController {
    @Autowired
    IUserService userService;
    @Autowired
    FirebaseStorageService firebaseStorageService;
    @GetMapping(value = "")
    public String transfer(HttpSession session){
        if(session.getAttribute("id") == null){
            return "redirect:/login";
        }
        return "redirect:/article/getArticle";
    }
    @GetMapping(value = "/login")
    public String showLogin(ModelMap modelMap) {
        modelMap.addAttribute("user", new User());
        return "login";
    }
    @PostMapping(value = "/upload")
    public void handleFileUpload(@RequestParam("files") List<MultipartFile> files) throws IOException {
        // Xử lý tải lên hình ảnh và lưu trữ thông tin trong cơ sở dữ liệu
        for (MultipartFile file : files) {
            String fileName = System.currentTimeMillis() +".jpg";
            InputStream inputStream = file.getInputStream();
            firebaseStorageService.uploadImageA(inputStream,fileName);
            inputStream.close();
        }
    }
    @GetMapping(value = "/register")
    public String showReg(ModelMap modelMap){
        modelMap.addAttribute("user", new User());
        return "registerTest";
    }
    @PostMapping(value = "/register")
    public String register(ModelMap modelMap,
                           @RequestParam("image") MultipartFile file,
                           @Valid @ModelAttribute("user") User user,
                           BindingResult bindingResult){
        try{
            if(user.getPhoneNumber() == null)
            {
                modelMap.addAttribute("error","Phone number cannot null!!");
                modelMap.addAttribute("user", new User());
                return "registerTest";
            }else if(user.getName() == null){
                modelMap.addAttribute("error","Name cannot null!!");
                modelMap.addAttribute("user", new User());
                return "registerTest";
            }else if(user.getPassword() == null){
                modelMap.addAttribute("error","Password cannot null!!");
                modelMap.addAttribute("user", new User());
                return "registerTest";
            }
            if(userService.findByPhoneNumber(user.getPhoneNumber()).isEmpty())
            {
                if(!file.isEmpty()){
                    String fileName = System.currentTimeMillis() +".jpg";
                    user.setImage(fileName);
                    InputStream inputStream = file.getInputStream();
                    firebaseStorageService.uploadImageU(inputStream,fileName);
                    inputStream.close();
                }else{
                    user.setImage("default.jpg");
                }
                userService.submitUser(user);
                return "redirect:/login";
            }else {
                modelMap.addAttribute("error","Phone number exist!!");
                modelMap.addAttribute("user", new User());
                return "registerTest";
            }
        }catch (Exception e){
            modelMap.addAttribute("error",e.toString());
            modelMap.addAttribute("user", new User());
            return "registerTest";
        }
    }

    @PostMapping (value = "/login")
    public String checkLogin(ModelMap modelMap,
                             @ModelAttribute("user") User user,
                             HttpSession session){
        if(userService.checkLogin(user.getPhoneNumber(),user.getPassword())){
            System.out.println("Success");
            Optional<User> userLogin = userService.findByPhoneNumber(user.getPhoneNumber());
            User userLogin1 = userLogin.get();
            session.setAttribute("USERNAME", userLogin1.getName());
            session.setAttribute("id", userLogin1.getUserID());
            return "redirect:/article/getArticle";
        }else{
            System.out.println("Fail");
            modelMap.addAttribute("ERROR", "Khong tim thay username hoac mat khau");
            return "login";
        }
    }
    @GetMapping(value = "/logout")
    public String logOut(HttpSession session){
        session.removeAttribute("USERNAME");
        session.removeAttribute("id");
        return "redirect:/login";
    }
}
