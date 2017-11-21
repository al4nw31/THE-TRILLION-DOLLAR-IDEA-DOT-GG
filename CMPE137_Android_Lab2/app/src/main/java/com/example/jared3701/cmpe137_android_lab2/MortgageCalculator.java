package com.example.jared3701.cmpe137_android_lab2;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

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
                textView.setText("Error");
            }
        });





    }
}
