package com.example.fitness_app;

import android.content.Intent;
import android.os.Bundle;
import android.view.Gravity;
import android.widget.ProgressBar;
import android.widget.TableLayout;
import android.widget.TableRow;
import android.widget.TextView;

import androidx.annotation.NonNull;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    public static MainActivity mainActivity;
    private static final String calorieInfoFile = "calorie_info.txt";
    private static HashMap<String, Integer> calorieInfo = new HashMap<>();
    private static final String Channel = "food.detection/java";
    private static boolean done = false;
    private static MethodChannel.Result ChannelResult;
    private static String Test = " ";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        new MethodChannel(getFlutterEngine().getDartExecutor(),Channel).setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
                if(call.method.equals("start")){
                    startActivityForResult(new Intent(getApplicationContext(), DetectorActivity.class),1);
                    ChannelResult = result;
                }
            }
        });
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        List<String> empty_list = new ArrayList<>();
        ChannelResult.success(empty_list);
        finish();
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        try{
            List<String> results = data.getStringArrayListExtra("res");
            ChannelResult.success(results);
        }catch (Exception e){
            List<String> empty_list = new ArrayList<>();
            ChannelResult.success(empty_list);
        }

    }

    public static MainActivity getInstance() {
        return mainActivity;
    }



    //    public void addFood(String food) {
//        int calories = getCalorie(food);
////        TextView total = (TextView) findViewById(R.id.total);
////        TextView progressBar_total = (TextView) findViewById(R.id.progressBar_total);
//        int cur = Integer.parseInt(total.getText().toString());
//        cur += calories;
//        total.setText(cur + "");
//        progressBar_total.setText("Current calories: " + cur + "");
//        ProgressBar progressBar = (ProgressBar) findViewById(R.id.progressBar3);
//        progressBar.setProgress(cur);
////        TableLayout t1 = (TableLayout) findViewById(R.id.tablelayout);
////        TableRow tr = new TableRow(this);
////        tr.setLayoutParams(new TableRow.LayoutParams(TableRow.LayoutParams.MATCH_PARENT, TableRow.LayoutParams.MATCH_PARENT));
////        TextView date = new TextView(this);
////        TextView foodItem = new TextView(this);
////        TextView cals = new TextView(this);
//
//        long tsLong = (long) (System.currentTimeMillis() / 1000);
//        java.util.Date d = new java.util.Date(tsLong * 1000L);
//        String ts = new SimpleDateFormat("h:mm a").format(d);
//        date.setText(ts);
//        foodItem.setText(food);
//        cals.setText(calories + "");
//        date.setGravity(Gravity.CENTER);
//        foodItem.setGravity(Gravity.CENTER);
//        cals.setGravity(Gravity.CENTER);
//
//        date.setLayoutParams(new TableRow.LayoutParams(0));
//        foodItem.setLayoutParams(new TableRow.LayoutParams(1));
//        cals.setLayoutParams(new TableRow.LayoutParams(2));
//        date.getLayoutParams().width = 0;
//        foodItem.getLayoutParams().width = 0;
//        cals.getLayoutParams().width = 0;
//        tr.addView(date);
//        tr.addView(foodItem);
//        tr.addView(cals);
//        t1.addView(tr);
//    }

//    public int getCalorie(String food) {
//        return calorieInfo.get(food);
//    }
//
//    private HashMap loadCalorieInfo(String filename) throws IOException {
//        BufferedReader reader = new BufferedReader(new InputStreamReader(getAssets().open(filename)));
//        HashMap<String, Integer> calCounts = new HashMap<>();
//
//        String line;
//        while ((line = reader.readLine()) != null) {
//            calCounts.put(line.split(": ")[0], Integer.parseInt(line.split(": ")[1]));
//        }
//        return calCounts;
//    }
}