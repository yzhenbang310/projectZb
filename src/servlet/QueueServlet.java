package servlet;

import database.DB;
import entity.queue;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;



/**
 * Created by user on 15/12/2016.
 */


@WebServlet(name="Queue Servlet", urlPatterns ="/queuemain")
public class QueueServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        DB db = null;
        try {
            db = new DB();
            List<queue> qList = db.getAllQueue();
            queue temp = new queue();
            int no = 1;
            if(qList.isEmpty()){
                no = 1;
            }else{
                no = qList.get(qList.size()-1).getQueueNo()+1;
            }
            temp.setQueueNo(no);
            temp.setDoctorName("fda");
            temp.setPatientId(123);
            //String submit = request.getParameter("submitQueue");
            if(db.createQueueNumber(temp)){
                request.getRequestDispatcher("QueueMain.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

   /*private void takeQueueNumber() {

            int patientId = request.getParameter("patientId");
            int patientId = DB.insert(patientId);

            DB.insert(patientId);
            queue que = DB.retrieveByPatientId(patientId);
            int id = que.getPatientId();

            int amountBefore = DB.retrieveQueuesTodayUnfinished();
            double timeRemaining = amountBefore * 5min;
            DateTime now = new DateTime();
            timeRemaining = now + timeRemaining;

            response.setparameter("id",id);
            response.setparameter("nric",nric);
            response.setparameter("timeToQueue",timeRemaining);

    }

    private Guess() {
        if (userList == null) {
            reset();
        }
        day = Calendar.getInstance().get(Calendar.DAY_OF_MONTH);
    }

    private void reset() {
        luckyNumber = random.nextInt(100);
        userList = new HashMap<String, Integer>();
        System.out.println("New lucky number " + luckyNumber);
    }
    /*
        Use this method to guess the value of the lucky number
        Each user is entitled 3 tries to guess the right number, and this method will also record/verify the attempts
        If return value is
        0 - Bingo, you guess correctly
        1 - Your number is higher than the lucky number
        -1 - Your number is lower than the lucky number
        999 - Your have tried 3 times, you cannot try again
     */
   /* public int guess(String nric, int value) {
       if (!isSameDay()) {
           reset();
       }
       if (userList.containsKey(nric)) {
           Integer i = userList.get(nric);
           userList.put(nric, ++i);
           if (i > 3) return 999;
           else return checkNumber(value);
       } else {
           userList.put(nric, 1);
           return checkNumber(value);
       }
   }

    */

   }


