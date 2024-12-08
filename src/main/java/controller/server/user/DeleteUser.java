package controller.server.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bo.UserBO;

import java.io.IOException;

@WebServlet(name = "DeleteUserServlet", value = "/dashboard/delete-user")
public class DeleteUser extends HttpServlet {
    private String message;
    private UserBO userBO;
    public void init() {
        message = "Hello World!";
        userBO = new UserBO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getParameter(("id"))!=null){
            String id=request.getParameter(("id"));
            try{
                userBO.deleteUser(id);
                response.sendRedirect("/dashboard/users");
            }catch (Exception e){
                e.printStackTrace();
            }
        }else{
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
        }
    }

    public void destroy() {
    }
}