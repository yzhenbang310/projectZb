package servlet;

import database.DB;
import entity.queue;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;



/**
 * Created by user on 15/12/2016.
 */


@WebServlet(name="Queue Servlet", urlPatterns ="/queue")
public class QueueServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        DB db = null;
        try {
            db = new DB();
            List<queue> list = db.getQueueNumbers();
            queue temp = null;
            temp.setQueueNo(list.get(list.size()-1).getQueueNo()+1);
            if(db.createQueueNumber(temp)){

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
