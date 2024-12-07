package controller.client.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bean.User;
import model.bo.UserBO;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserControllerServlet", value = "/dashboard/users")
public class index extends HttpServlet {
    private String message;
    private UserBO userBO;

    public void init() {
        message = "Hello World!";
        userBO = new UserBO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String query = "";
        if(request.getParameter("query") != null){
            query=request.getParameter("query");
        }
        String type="full_name";
        if(request.getParameter("type") != null){
            type=request.getParameter("type");
        }
        List<User> list = userBO.searchUsersByName(type,query);
        request.setAttribute("users", list);

        request.getRequestDispatcher("/pages/user/user.jsp").forward(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }



    public void destroy() {
    }
}