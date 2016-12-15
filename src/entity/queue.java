package entity;

/**
 * Created by user on 14/12/2016.
 */
public class queue {

    private int queueNo;
    private int patientId;
    private String doctorName;

    public int getQueueNo(){return queueNo;}

    public void setQueueNo(int queueNo){this.queueNo=queueNo;}

    public String getDoctorName() {
        return doctorName;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    public int getPatientId() {

        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }
}
