 �  �TCSO      qiyi_tips_statistics   tipStat
conflict
	dateBt$.V�� 	list	 conditions	�<item id="NoticeThisCopyrightWillExpire" level="11" duration="10" type="2" force="true">
  <conditions>
    <fields>
      <field name="bd" operator="eq" value="1"/>
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
                <span>《#videoName#》</span> 将于  <span>#expiredTime#</span> 版权到期.
            ]]></message>
  </list>
</item> 