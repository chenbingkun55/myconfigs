 ¿  dTCSO      qiyi_tips_statistics   tipStat
conflict
	list		ProYingyin 209102700	NextVideo 	dateBt*ïð  conditions	<item id="ProSubUpdate" level="1" duration="10" type="2">
  <conditions>
    <fields>
      <field name="curADState" operator="eq" value="false"/>
      <field name="c" operator="ex" value="10"/>
      <field name="startplay" operator="eq" value="130"/>
      <field name="cansubcribe" operator="eq" value="true"/>
      <field name="interval" operator="gt" value="900"/>
    </fields>
    <frequency count="5">
      <restrain name="day"/>
      <restrain name="user"/>
      <restrain name="album"/>
    </frequency>
  </conditions>
  <list>
    <message><![CDATA[ 
					ç²¾å½©æç»­è¿æ­ä¸­, åç»­<a href="event:ASEvent(subscribeA)"><u>æ´æ°éç¥æ¨!</u></a>
            ]]></message>
  </list>
</item><item id="ProFullMovie" level="1" duration="10" type="2">
  <conditions>
    <fields>
      <field name="curADState" operator="eq" value="false"/>
      <field name="pturl" operator="is"/>
      <field name="endplay" operator="eq" value="20"/>
      <field name="c" operator="in" value="10"/>
    </fields>
    <frequency count="1">
      <restrain name="day"/>
      <restrain name="user"/>
      <restrain name="album"/>
    </frequency>
  </conditions>
  <list>
    <message><![CDATA[  
                	ã<span>#keyword#</span>ãæ­£çæ´ç²¾å½©ã<a href="event:#pturl#"><u>ç«å³è§ç</u></a>
            ]]></message>
  </list>
</item>%<item id="ProSubMore" level="1" duration="10" type="2">
  <conditions>
    <fields>
      <field name="curADState" operator="eq" value="false"/>
      <field name="pturl" operator="not"/>
      <field name="endplay" operator="eq" value="20"/>
      <field name="c" operator="in" value="10"/>
      <field name="cansubcribe" operator="eq" value="true"/>
    </fields>
    <frequency count="1">
      <restrain name="day"/>
      <restrain name="user"/>
      <restrain name="album"/>
    </frequency>
  </conditions>
  <list>
    <message><![CDATA[  
                	æ´å¤ <span>#keyword#</span> ç¸å³è§é¢, <a href="event:ASEvent(subscribeC)"><u>æ´æ°æ¶éç¥æ</u></a>
            ]]></message>
  </list>
</item><item id="NoticeThisCopyrightWillExpire" level="11" duration="10" type="2">
  <conditions>
    <fields>
      <field name="curADState" operator="eq" value="false"/>
      <field name="curPlayDuration" operator="eq" value="60"/>
      <field name="expiredTimeInterval" operator="lt" value="8"/>
      <field name="c" operator="eq" value="2"/>
    </fields>
    <frequency count="1">
      <restrain name="day"/>
      <restrain name="album"/>
    </frequency>
  </conditions>
  <list>
    <message><![CDATA[  
                <span>ã#videoName#ã</span> å°äº  <span>#expiredTime#</span> çæå°æ.
            ]]></message>
  </list>
</item><item id="ProYingyin" level="2" duration="10" type="2" changed="1">
  <conditions>
    <fields>
      <field name="curADState" operator="eq" value="false"/>
      <field name="candownload" operator="eq" value="true"/>
      <field name="vv" operator="eq" value="1"/>
    </fields>
    <frequency count="1">
      <restrain name="day"/>
    </frequency>
  </conditions>
  <list>
    <message><![CDATA[  
            	  æ¨èæ¨ä½¿ç¨ææ°çç±å¥èºè§é¢åPPSå½±é³ï¼æ­æ¾å¿«ãå¹¿åå° <a href="event:http://static.qiyi.com/ext/common/QIYImedia_play.exe"><b><u><span>ç«å³å®è£</span></u></b></a>
            ]]></message>
  </list>
</item>[<item id="ProAppStore" level="2" duration="8" type="2" changed="1">
  <conditions>
    <fields>
      <field name="curADState" operator="eq" value="false"/>
      <field name="vv" operator="eq" value="2"/>
    </fields>
    <frequency count="1">
      <restrain name="day"/>
    </frequency>
  </conditions>
  <list>
    <message><![CDATA[  
                	æ¨èä¸è½½<span> ç±å¥èºç§»å¨å®¢æ·ç«¯ </span>ï¼ç²¾å½©å¤§çéæ¶çï¼<a href="event:http://ota.iqiyi.com/t.jsp?cid=575"><u>ç¹å»æ¥ç</u></a>
            ]]></message>
  </list>
</item>o<item id="ProYingyin1" level="2" duration="10" type="2" changed="1">
  <conditions>
    <fields>
      <field name="curADState" operator="eq" value="false"/>
      <field name="candownload" operator="eq" value="true"/>
      <field name="vv" operator="eq" value="3"/>
    </fields>
    <frequency count="1">
      <restrain name="day"/>
    </frequency>
  </conditions>
  <list>
    <message><![CDATA[  
                	ä¸è½½ç±å¥èºè§é¢åPPSå½±é³ç¦»çº¿è§çæ¬ç <a href="event:http://static.qiyi.com/ext/common/QIYImedia_play.exe"><b><u><span>ç«å³å®è£</span></u></b></a>
            ]]></message>
  </list>
</item><item id="ProYingyin2" level="2" duration="10" type="2" changed="1">
  <conditions>
    <fields>
      <field name="curADState" operator="eq" value="false"/>
      <field name="candownload" operator="eq" value="true"/>
      <field name="vv" operator="eq" value="5"/>
    </fields>
    <frequency count="1">
      <restrain name="day"/>
    </frequency>
  </conditions>
  <list>
    <message><![CDATA[  
                	æ¨èæ´æä½ ç±å¥èºè§é¢åPPSå½±é³, å°½äº«ä¸ªæ§åä½éª <a href="event:http://static.qiyi.com/ext/common/QIYImedia_play.exe"><b><u><span>ç«å³å®è£</span></u></b></a>
            ]]></message>
  </list>
</item>-<item id="ProYingyin3" level="2" duration="10" type="2" changed="1">
  <conditions>
    <fields>
      <field name="curADState" operator="eq" value="false"/>
      <field name="candownload" operator="eq" value="true"/>
      <field name="vv" operator="eq" value="7"/>
    </fields>
    <frequency count="1">
      <restrain name="day"/>
    </frequency>
  </conditions>
  <list>
    <message><![CDATA[  
                	æ­æ¾å¿«ãå¹¿åå°ãç¦»çº¿çï¼æ´æä½ çç±å¥èºè§é¢åPPSå½±é³ </span><a href="event:http://static.qiyi.com/ext/common/QIYImedia_play.exe"><b><u><span>ç«å³å®è£</span></u></b></a>
            ]]></message>
  </list>
</item>m<item id="ADBonusTip" level="3" duration="5" type="2" changed="2">
  <conditions>
    <fields>
      <field name="totalPlayingDurationIsHalfHour" operator="eq" value="true"/>
      <field name="curADState" operator="eq" value="true"/>
      <field name="adBonus" operator="neq" value="0"/>
    </fields>
    <frequency count="1">
      <restrain name="day"/>
    </frequency>
  </conditions>
  <list>
    <message><![CDATA[  
                	æè°¢æ¨è§çç±å¥èºå¹¿åï¼èµ éæ¨ <span>#adBonus#</span> ä¸ªç§¯å .
            ]]></message>
  </list>
</item><item id="VideoBonusTip" level="3" duration="5" type="2" changed="2">
  <conditions>
    <fields>
      <field name="totalPlayingDurationIsHalfHour" operator="eq" value="true"/>
      <field name="videoBonus" operator="neq" value="0"/>
      <field name="curADState" operator="eq" value="false"/>
      <field name="delayTime" operator="eq" value="0"/>
    </fields>
    <frequency count="3">
      <restrain name="day"/>
    </frequency>
  </conditions>
  <list>
    <message><![CDATA[  
                	ç±äºæ¨æè¿30åéåè§ççè§é¢ï¼è·å¾ <span>#videoBonus#</span> ä¸ªç§¯å .
            ]]></message>
  </list>
</item> 