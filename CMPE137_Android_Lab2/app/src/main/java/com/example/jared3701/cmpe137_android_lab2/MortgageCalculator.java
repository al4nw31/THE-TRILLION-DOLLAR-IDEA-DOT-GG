package com.example.jared3701.cmpe137_android_lab2;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
//myImports
import android.view.inputmethod.InputMethodManager;
import android.content.Context;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class MortgageCalculator extends AppCompatActivity {

    //GUI objects
    //Input
    EditText editTextHomeValue;
    EditText editTextDownPayment;
    EditText editTextInterestRate;
    EditText editTextTerms;
    EditText editTextPropertyTaxRate;

    //Output
    TextView textView;
    EditText editTextMonthlyPaymentAmount;
    EditText editTextTotalInterestPaid;
    EditText editTextTotalPropertyTaxPaid;
    EditText editTextPayOffDate;

    Button buttonReset;
    Button buttonCalculate;

    double rate=0; //((annual interest rate)/100)/12
    double nper=0; //12 * (number of years)
    double pv=0;   //principle of loan -> Home Value in the case.
    double totalInterest=0;
    double monthlyPayment=0;
    double totalPropertyTax=0;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_mortgage_calculator);

        //buttons
        buttonReset=(Button) findViewById(R.id.button2);
        buttonCalculate=(Button) findViewById(R.id.button);

        //input
        editTextHomeValue=(EditText) findViewById(R.id.editText12);
        editTextDownPayment=(EditText) findViewById(R.id.editText13);
        editTextInterestRate=(EditText) findViewById(R.id.editText15);
        editTextTerms=(EditText) findViewById(R.id.editText16);
        editTextPropertyTaxRate=(EditText) findViewById(R.id.editText17);

        //output
        textView=(TextView)  findViewById(R.id.textView);
        editTextMonthlyPaymentAmount=(EditText) findViewById(R.id.editText19);
        editTextTotalInterestPaid=(EditText) findViewById(R.id.editText20);
        editTextTotalPropertyTaxPaid=(EditText) findViewById(R.id.editText21);
        editTextPayOffDate=(EditText) findViewById(R.id.editText22);

        //Don't allow ouput EditText fields to be edited.
        textView.setText("");
        editTextMonthlyPaymentAmount.setEnabled(false);
        editTextTotalInterestPaid.setEnabled(false);
        editTextTotalPropertyTaxPaid.setEnabled(false);
        editTextPayOffDate.setEnabled(false);


        buttonReset.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                textView.setText("");
                editTextHomeValue.setText("");
                editTextDownPayment.setText("");
                editTextInterestRate.setText("");
                editTextTerms.setText("");
                editTextPropertyTaxRate.setText("");
                editTextMonthlyPaymentAmount.setText("");
                editTextTotalInterestPaid.setText("");
                editTextTotalPropertyTaxPaid.setText("");
                editTextPayOffDate.setText("");
            }
        });

        buttonCalculate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                //Closes keyboard when Calculate is pushed.
                InputMethodManager inputManager = (InputMethodManager)
                        getSystemService(Context.INPUT_METHOD_SERVICE);
                inputManager.hideSoftInputFromWindow(getCurrentFocus().getWindowToken(),
                        InputMethodManager.HIDE_NOT_ALWAYS);
                if(editTextInterestRate.getText().toString().equals("")  || editTextTerms.getText().toString().equals("") || editTextHomeValue.getText().toString().equals(""))
                {
                    textView.setText("Error: Please make sure to fill out: Home Value, Interest rate, and Terms");
                }
                else{
                    //Calculates Monthly Payments
                    if(editTextDownPayment.getText().toString().equals("") || editTextDownPayment.getText().toString().equals("0")){
                        rate = (Double.parseDouble(editTextInterestRate.getText().toString())/100)/12;
                        nper = Double.parseDouble(editTextTerms.getText().toString())*12;
                        pv = Double.parseDouble(editTextHomeValue.getText().toString());
                        double top = rate * Math.pow(1+rate,nper);
                        double bottom = Math.pow(1+rate, nper) -1;
                        monthlyPayment = pv * (top/bottom);
                        totalInterest = (monthlyPayment * nper)-pv;
                        editTextMonthlyPaymentAmount.setText(Double.toString(Math.round((monthlyPayment * 100.0))/100.0));
                        editTextTotalInterestPaid.setText(Double.toString(Math.round((totalInterest * 100.0))/100.0));
                    }
                    else if(!editTextDownPayment.getText().toString().equals("") || !editTextDownPayment.getText().toString().equals("0")){
                        rate = (Double.parseDouble(editTextInterestRate.getText().toString())/100)/12;
                        nper = Double.parseDouble(editTextTerms.getText().toString())*12;
                        //The calculation for PV is the only difference as the person as put down a down Payment
                        pv = Double.parseDouble(editTextHomeValue.getText().toString());
                        double downPayment = Double.parseDouble(editTextDownPayment.getText().toString());
                        double top = rate * Math.pow(1+rate,nper);
                        double bottom = Math.pow(1+rate, nper) -1;
                        monthlyPayment = (pv - downPayment) * (top/bottom);
                        totalInterest = (monthlyPayment * nper)- (pv -downPayment);
                        editTextMonthlyPaymentAmount.setText(Double.toString(Math.round((monthlyPayment * 100.0))/100.0));
                        editTextTotalInterestPaid.setText(Double.toString(Math.round((totalInterest * 100.0))/100.0));
                    }

                    if(editTextPropertyTaxRate.getText().toString().equals("") || editTextPropertyTaxRate.getText().toString().equals("0")){
                        //Do nothing if There is no value in Property Tax Rate
                    }
                    else{
                        double propertyTaxRate = Double.parseDouble(editTextPropertyTaxRate.getText().toString())/100.0;
                        totalPropertyTax = pv * propertyTaxRate;
                        editTextTotalPropertyTaxPaid.setText(Double.toString(Math.round((totalPropertyTax * 100.0))/100.0));
                    }


                    //Calculates the Pay off Date -> There must be a Value in Terms so this should always be found.
                    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
                    Calendar c = Calendar.getInstance();
                    c.setTime(new Date()); // Now use today date.
                    c.add(Calendar.MONTH, (int)nper); // Adds the months that are left to the current date.
                    String output = sdf.format(c.getTime());
                    editTextPayOffDate.setText(output);
                }

            }
        });





    }
}
