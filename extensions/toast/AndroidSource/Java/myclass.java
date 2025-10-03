package ${YYAndroidPackageName};
import ${YYAndroidPackageName}.R;
import com.yoyogames.runner.RunnerJNILib;
import ${YYAndroidPackageName}.RunnerActivity;

import android.os.Bundle;
import android.widget.Toast;

public class myclass{

    public double addTwoNumber(double val0 , double val1){

        return val0 + val1 ;
    }

    public double show_toast(final String text){

        RunnerActivity.CurrentActivity.runOnUiThread(new Runnable() {
  				public void run() {
                    Toast.makeText(RunnerActivity.CurrentActivity,text,Toast.LENGTH_LONG).show();
                }
        });
        
        return 0 ;
    }

}