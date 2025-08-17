package com.insert.controller;

import com.insert.model.BillBean;
import com.insert.model.CartItemBean;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/BillingServlet")
public class BillingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cusName = request.getParameter("cus_name");
        String cusNic = request.getParameter("cus_nic");
        double givenAmount = Double.parseDouble(request.getParameter("given_amount"));

        HttpSession session = request.getSession();
        List<CartItemBean> cart = (List<CartItemBean>) session.getAttribute("cart");

        double grandTotal = 0;
        if (cart != null) {
            for (CartItemBean item : cart) {
                grandTotal += item.getTotal();
            }
        }

        double balance = givenAmount - grandTotal;

        BillBean bill = new BillBean();
        bill.setCusName(cusName);
        bill.setCusNic(cusNic);
        bill.setGivenAmount(givenAmount);
        bill.setGrandTotal(grandTotal);
        bill.setBalance(balance);

        session.setAttribute("bill", bill);

        RequestDispatcher rd = request.getRequestDispatcher("/Views/bill_print.jsp");
        rd.forward(request, response);
    }
}
