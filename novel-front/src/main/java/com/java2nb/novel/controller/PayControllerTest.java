package com.java2nb.novel.controller;

import com.alibaba.fastjson.JSONObject;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class PayControllerTest {
    @Test
    public void test(){
        String message = "{\"alipay_trade_query_response\":\n" +
                "    {\"code\":\"10000\",\n" +
                "    \"msg\":\"Success\",\n" +
                "    \"buyer_logon_id\":\"xyv***@sandbox.com\",\n" +
                "    \"buyer_pay_amount\":\"0.00\",\n" +
                "    \"buyer_user_id\":\"2088622987443357\",\n" +
                "    \"buyer_user_type\":\"PRIVATE\",\n" +
                "    \"invoice_amount\":\"0.00\",\n" +
                "    \"out_trade_no\":\"202207282048461454\",\n" +
                "    \"point_amount\":\"0.00\",\n" +
                "    \"receipt_amount\":\"0.00\",\n" +
                "    \"send_pay_date\":\"2022-07-28 20:49:05\",\n" +
                "    \"total_amount\":\"10.00\",\n" +
                "    \"trade_no\":\"2022072822001443350505598505\",\n" +
                "    \"trade_status\":\"TRADE_SUCCESS\"},\n" +
                "    \"sign\":\"UViusob2cB/C2lS4Mna5+bZVYkf+rZItVj60NeB+tynLu/X95nr/+K4CYqNHvqwDWPDT37oSYDxKjtfGS+PLWS6LTGJ3BxMbXEntZTuXpq50s2f4FQA8fXB4jthBx8T8Os7HqUeUx0IYVXZIDwnDGtymjYE/nmR1fqlMPkOywpNUE3U8g4le9/CG41ZnnJgi+90su5zsV5VK/RUDTpX6mR4gcdhdldogLnGPmTAAdyoyDLAVfAH2v0Bteg0PgF1HgnnhUAh89Rj5gFTb3scZHsRM39NfFa0udpcbhcDbXUkpTLKQGIaxdAxuoQXO7dfCUomkmDxawh1OwCZBhrWAGg==\"}";
        //将字符串转换成json
        JSONObject jsonObject = JSONObject.parseObject(message);
        //取出data里的数据
        String data = jsonObject.getString("alipay_trade_query_response");
        JSONObject jsonObject2 = JSONObject.parseObject(data);
        String data2=jsonObject2.getString("total_amount").toString();
        String num="10.00";
        System.out.println(data2.equals(num)); //输出结果为：{"name":"lisi","id":1001}
    }

}