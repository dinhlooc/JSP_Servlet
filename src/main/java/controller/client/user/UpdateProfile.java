package controller.client.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bean.User;
import model.bo.UserBO;

import java.io.IOException;

@WebServlet(name = "UpdateProfileServlet", value = "/update-user")
public class UpdateProfile extends HttpServlet {
    private String message;
    private UserBO userBO;
    public void init() {
        message = "Hello World!";
        userBO=new UserBO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getParameter("id")!=""){
            String id=request.getParameter("id");
            try{
                User user= userBO.getUserById(id);
                request.setAttribute("user", user);
                request.getRequestDispatcher("/pages/users/update-user.jsp").forward(request,response);
            }catch (Exception e){
                request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
                e.printStackTrace();
            }


        }else{
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id = request.getParameter("Id");
        String fullName = request.getParameter("Fullname");
        String password = request.getParameter("Password");
        String newPassword = request.getParameter("NewPassword");
        User user=userBO.getUserById(id);
        if (user==null){
            response.sendRedirect("/dashboard/users");
        }
        try {
            user.setFullName(fullName);
            user.setPassword(newPassword);
            userBO.updateUser(user);
            response.sendRedirect("/dashboard/users");
        } catch (Exception e) {
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
            e.printStackTrace();
        }

    }

    public void destroy() {
    }
}