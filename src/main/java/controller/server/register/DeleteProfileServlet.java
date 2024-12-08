package controller.server.register;

import java.io.IOException;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bo.RegistrationProfileBO;

@WebServlet("/dashboard/registration/delete")
public class DeleteProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeleteProfileServlet() {
        super();
    }

    // Xử lý yêu cầu GET
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response); // Gọi doPost để xử lý xóa
    }

    // Xử lý yêu cầu POST
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy ID của profile cần xóa từ tham số request
        String profileId = request.getParameter("id");

        if (profileId != null && !profileId.isEmpty()) {
            RegistrationProfileBO profileBO = new RegistrationProfileBO();
            boolean isDeleted = profileBO.deleteRegistrationProfile(profileId);

            // Kiểm tra kết quả và chuyển hướng
            if (isDeleted) {

                response.sendRedirect("/dashboard/registrations");
            } else {
                // Nếu xóa thất bại, chuyển hướng và thông báo lỗi
                response.sendRedirect("/dashboard/registrations");
            }
        } else {
            // Nếu không có ID hợp lệ, chuyển hướng đến trang danh sách và thông báo lỗi
            response.sendRedirect("ProfileList.jsp?message=invalidId");
        }
    }
}