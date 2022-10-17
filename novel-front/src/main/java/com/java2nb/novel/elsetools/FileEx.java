package com.java2nb.novel.elsetools;

import java.io.*;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
public class FileEx {

    public FileEx() throws IOException{

            //BufferedReader是可以按行读取文件
            FileInputStream inputStream = new FileInputStream("/home/woa/programme/novelWeb/pythonTool/xuanji");
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));

            String str = null;
            while((str = bufferedReader.readLine()) != null)
            {
                System.out.println(str);
            }

            //close
            inputStream.close();
            bufferedReader.close();


    }

}
