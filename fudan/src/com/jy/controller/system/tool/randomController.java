package com.jy.controller.system.tool;

import java.util.Random;

import com.jy.controller.base.BaseController;

public class randomController extends BaseController<Object>{
	
	/**
	 * 随机数生成  4位
	 */
	public static String random(){
		Random random = new Random();
        String fourRandom = random.nextInt(10000) + "";
        int randLength = fourRandom.length();
        if(randLength<4){
          for(int i=1; i<=4-randLength; i++){
              fourRandom = "0" + fourRandom;
        	}
		}
        return fourRandom;
	}
	
}
