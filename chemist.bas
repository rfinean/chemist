   33MODE4
   34VDU23;8202;0;0;0;
   35*KEY0
   36REMLU
   37DIMca%(25),gi$(13)
   38A%=RND(-TIME)
   41un%=4
   42VDU19,1,3,0,0,0
   43*FX4,1
   44*FX11,0
   45 
   46ONERRORGOTO900
   47qn%=0:cr%=0:tm%=0:crb%=0
   49VDU4
   50CLS:GCOL0,1
   51SOUND1,-15,200,1:SOUND1,0,0,1:SOUND1,-15,200,1
   60PRINTTAB(16,1)"CHEMIST":PROCbox(0,938,1279,1022)
   70PRINTTAB(1,4)"The 7 units are as follows :"
   75PROCgbox(0,316,1279,810)
   80PRINTTAB(7,8)"Element symbols"
   90PRINTTAB(7,10)"Element valencies"
  100PRINTTAB(7,12)"Revision of units 1 & 2"
  110PRINTTAB(7,14)"Formulae of simple compounds"
  120PRINTTAB(7,16)"Radical formulae & valencies"
  121PRINTTAB(7,18)"Gas formulae, 1,2 & 5 revision"
  130PRINTTAB(7,20)"Formulae of compounds"
  155PRINTTAB(1,23)"Press -"TAB(11,25)"- to move box up"
  156PRINTTAB(11,27)"- to move box down"
  157PRINTTAB(11,29)"- to end program run"
  158PRINTTAB(1,31)"SPACE BAR - to confirm unit choice";
  170PROCkey(CHR$228,132,224):PROCkey(CHR$229,132,160):PROCkey("ES",132,96)
  174PRINTTAB(3,6+un%*2);un%;" -";
  175PROCbox(80,780-un%*64,1199,852-un%*64)
  179REPEAT
  180uan$=GET$
  181UNTILuan$=CHR$139ORuan$=CHR$138ORuan$=" "
  192IFuan$=CHR$138ANDun%<7THENPROCclearbox:un%=un%+1:GOTO174
  193IFuan$=CHR$139ANDun%>1THENPROCclearbox:un%=un%-1:GOTO174
  200IFuan$<>" "THEN179
  201ONERRORGOTO45
  202CLS:PRINTTAB(11,5)"Chemist - unit ";un%:PROCbox(0,800,1279,895)
  204ONun%GOSUB1400,2400,3400,4400,5400,7400,6400
  205PRINTTAB(0,18)"Press -"TAB(10,20)"to select a different unit"
  206PRINTTAB(0,22)"SPACE BAR to begin test"
  207PROCkey("ES",32,384)
  208IFsb%=FALSE THENREPEATUNTILGET$=" ":GOTO230
  209PRINTTAB(10,22)"if all 3 red lights are off"
  210PRINTTAB(10,24)"if the ""caps lock"" light is on"
  211PRINTTAB(10,26)"if the ""shift lock"" light on"
  212PROCkey("CL",32,256):PROCkey("SL",32,192)
  213IFINKEY$(0)=" "ORINKEY(-81)ORINKEY(-65)THEN230ELSE213
  230 
  240qn%=qn%+1
  245ONERRORGOTO540
  250ONun%GOSUB1000,2000,3000,4000,5000,7000,6000
  251VDU19,1,7,0,0,0
  260CLS:PRINTTAB(28,1)"Question ";qn%
  270PROCbox(864,944,1279,1008)
  280PRINTTAB(30,4)"Unit ";un%
  290PROCgbox(864,848,1279,912)
  300PRINTTAB((26-LEN(qna$))/2,2)qna$
  310PRINTTAB((26-LEN(qnb$))/2,4)qnb$
  320PROCbox(0,816,832,1008)
  325PROCbox(0,704,832,800)
  330PRINTTAB(1,8)"1st attempt :";:TIME=0:uan$=FNgpi(2-sb%*10,sb%,448,764):tm%=tm%+TIME
  340PROCbox(864,704,1279,800)
  341GCOL0,0:PROCbox(0,704,832,800)
  342GCOL0,1:PROCgbox(0,704,832,800)
  350IFuan$=ana$ORuan$=anb$THEN440
  360PRINTTAB(28,8)"No"
  370ONun%GOSUB1500,2500,3500,4500,5500,7500,6500
  380PROCbox(0,384,832,488)
  390PRINTTAB(1,18)"2nd attempt :";:uan$=FNgpi(2-sb%*10,sb%,448,444)
  400PROCbox(864,384,1279,488)
  401GCOL0,0:PROCbox(0,384,832,488)
  402PROCbox(864,704,1279,800)
  403GCOL0,1:PROCgbox(0,384,832,488)
  404PROCgbox(864,704,1279,800)
  410IFuan$<>ana$ANDuan$<>anb$THENPRINTTAB(28,18)"No":ONun%GOSUB1800,2800,3800,4800,5800,7800,6800:GOTO460
  420PRINTTAB(28,18)"Correct":crb%=crb%+1:GOTO460
  440PRINTTAB(28,8)"Correct":cr%=cr%+1
  460PRINTTAB(28,22)"Press SPACE"
  470PRINTTAB(28,24)"to continue"
  480PRINTTAB(28,26)"or"
  485PROCkey("ES",1008,192)
  490PRINTTAB(28,28)"to view"
  500PRINTTAB(28,30)"results"
  510PROCbox(864,16,1279,336)
  520IFGET$<>" "THEN520
  530IFqn%<25THEN240
  540 
  541ONERRORGOTO45
  542VDU4:CLS:VDU19,1,3;0;:PRINTTAB(20,1)"Unit ";un%;" - Results"
  545GCOL0,1:PROCbox(512,928,1279,1023)
  550PRINTTAB(18,6)"No. of correct"
  560PRINTTAB(18,8)"1st attempts  : ";cr%
  580PRINTTAB(18,10)"2nd attempts  : ";crb%
  590PRINTTAB(18,14)"No. of qstns. : ";qn%
  600@%=&102010A:PRINTTAB(18,16)"Response time : ";LEFT$(STR$((tm%/qn%)/100),5);"s":@%=&A0A
  610PROCgbox(0,0,480,1023)
  615VDU5
  620PROCbox(336,32,320,992)
  621MOVE320,992:DRAW368,992:MOVE380,1008:PRINT"1OO"
  622MOVE320,32:DRAW368,32:MOVE380,36:PRINT"O%"
  630bh%=cr%/qn%*992
  640FORlp%=32TObh%STEP4
  641IFlp%MOD240<>0THEN650
  642IFlp%=720THENSOUND1,-3,81,1:GOTO650
  643SOUND1,-3,(37+lp%DIV240*16),1
  650MOVE64,lp%:DRAW288,lp%
  660NEXT
  665IFcr%=qn%ORcr%=0THEN680
  670MOVE336,lp%-4:DRAW368,lp%-4:MOVE380,lp%+12:PRINT;INT(cr%/qn%*100);"%"
  680VDU4:PRINTTAB(18,20);
  690ONbh%/288+1GOTO760,760,730,700
  700IFqn%<25THEN790
  701PRINT"Well done. Next time"
  710PRINTTAB(18,22)"try a higher unit"
  720GOTO790
  730IFqn%<25THEN790
  731PRINT"Quite good. Try for"
  740PRINTTAB(18,22)"a few more marks"
  750PRINTTAB(18,24)"next time":GOTO790
  760IFqn%<5THEN790
  761PRINT"This is unsatisfactory"
  770PRINTTAB(18,22)"Consult a teacher if"
  780PRINTTAB(18,24)"you are in difficulty"
  790PRINTTAB(21,28)"SPACE  to continue"
  800PRINTTAB(18,30)"or        to end test"
  805PROCkey("ES",680,64)
  810PROCbox(512,0,1279,160)
  820IFGET$<>" "THEN820
  830IFqn%<25THEN240ELSE45
  900 
  902GCOL0,1:VDU4
  910CLS:PROCbox(0,800,1279,895):PRINTTAB(14,5)"To finish"
  920PROCbox(0,128,1279,768)
  930PRINTTAB(5,13)"1) Remove Disc from disc drive"
  940PRINTTAB(5,17)"2) If you want to re-start CHEMIST"
  941PRINTTAB(8,19)"press"
  950PRINTTAB(5,23)"3) Otherwise turn off the computer"
  951PRINTTAB(8,25)"and then the monitor"
  960PROCkey("ES",480,423)
  961ONERRORGOTO45
  962PRINTTAB(5,2)"Copyright (C) 1984 R.J.Finean"
  990TIME=GET:GOTO990
 1000 
 1010RESTORE:rq%=RND(32)
 1020IFFNused(rq%+4000)=TRUE THEN1010
 1025sb%=FALSE:ca%(qn%)=rq%+4000
 1030anb$=CHR$224
 1050FORlp%=1TOrq%
 1060READqnb$,ana$,vl%,vl%
 1070NEXTlp%
 1080qna$="What is the symbol for"
 1090RETURN
 1400PRINTTAB(4,11)"Capital letters can be obtained"
 1410PRINTTAB(4,13)"by pressing":PROCkey("SH",528,608)
 1420PRINTTAB(23,13)"with a letter":sb%=TRUE:RETURN
 1500IFFNups(ana$)<>FNups(uan$)THENPRINTTAB(15,13)"Try again":RETURN
 1550PRINTTAB(7,12)"You are confusing CAPITAL"
 1560PRINTTAB(5,14)"and small letters - Try again"
 1570RETURN
 1800IFFNups(ana$)<>FNups(uan$)THENPRINTTAB(8,26)"Bad luck :":GOTO1840
 1820IFLEFT$(ana$,1)=LEFT$(uan$,1)THENPRINTTAB(3,23)"The second letter, "RIGHT$(ana$,1)TAB(2,25)"must always be written"TAB(4,27)"as a small letter"
 1830IFLEFT$(ana$,1)<>LEFT$(uan$,1)THENPRINTTAB(3,23)"The first letter, "LEFT$(ana$,1)TAB(2,25)"must always be written"TAB(3,27)"as a capital letter"
 1840PRINTTAB(1,29)"The correct symbol is "ana$
 1850RETURN
 2000 
 2005RESTORE:rq%=RND(32)
 2010IFFNused(rq%+4050)=TRUE THEN2000
 2015sb%=FALSE:ca%(qn%)=rq%+4050
 2020FORlp%=1TOrq%
 2030READqnb$,sm$,ana$,anb$
 2040NEXTlp%
 2050qna$="What is the valency of"
 2060RETURN
 2400PRINTTAB(3,11)"When an element has more than one"
 2410PRINT'" common valency, type one of these only"
 2420sb%=FALSE:RETURN
 2500IFuan$=STR$(VAL(uan$))THENPRINTTAB(15,13)"Try again":RETURN
 2510PRINTTAB(9,12)"A valency is a number"
 2520PRINTTAB(13,14)"- Try again -":RETURN
 2800PRINTTAB(0,25)"Bad luck : The most common"
 2810IFana$=anb$THENPRINTTAB(7,28)"valency is "ana$
 2820IFana$<>anb$THENPRINTTAB(2,28)"valencies are "ana$" and "anb$
 2830RETURN
 3000 
 3005RESTORE:rq%=RND(32):sb%=FALSE
 3010ONRND(2)GOTO3020,3100
 3020IFFNused(rq%+4000)=TRUE THEN3000
 3030ca%(qn%)=rq%+4000
 3040GOTO1030
 3100IFFNused(rq%+4050)=TRUE THEN3000
 3110ca%(qn%)=rq%+4050
 3130GOTO2020
 3400PRINTTAB(6,11)"This unit contains questions"
 3410PRINTTAB(12,13)"from units 1 & 2":sb%=TRUE:RETURN
 3500IFana$="0"ORana$=STR$(VAL(ana$))THEN3600
 3510IFuan$<>STR$(VAL(uan$))THEN1500
 3520PRINTTAB(15,12)"SYMBOL !"
 3530PRINTTAB(10,14)"- not the valency"
 3540RETURN
 3600IFuan$=STR$(VAL(uan$))THENRETURN
 3610PRINTTAB(15,12)"VALENCY !"
 3620PRINTTAB(9,14)"- has to be a number"
 3630RETURN
 3800IFana$="0"ORana$=STR$(VAL(ana$))THEN2800ELSE1800
 4000 
 4002unb%=1
 4005RESTORE:rq%=RND(18):rb%=RND(.958^(rq%-1)*11):sb%=TRUE
 4006IFFNused(rq%*100+rb%)=TRUE THEN4005
 4007ca%(qn%)=(rq%*100+rb%)
 4010FORlp%=1TOrq%
 4020READmn$,ms$,va%,vb%
 4030NEXT
 4040RESTORE30040
 4070FORlp%=1TOrb%
 4080READnn$,ns$,vc%,vd%
 4090NEXT
 4100qna$="What is the formula for"
 4105IFrb%=9THENqnb$=mn$+" Phosphide":GOTO4140
 4110FORlp%=LEN(nn$)-1TO3STEP-1
 4120IFMID$(nn$,lp%,1)="y"ORMID$(nn$,lp%,1)="i"ORMID$(nn$,lp%,1)="o"ORMID$(nn$,lp%,1)="u"THEN qnb$=mn$+" "+LEFT$(nn$,lp%-1)+"ide":lp%=3
 4130NEXT
 4140IFva%=vb%THEN4200
 4150IFRND(5)=2THENva%=vb%
 4160RESTORE30500
 4170FORlp%=1TOva%:READva$:NEXT
 4180qnb$=LEFT$(qnb$,INSTR(qnb$," "))+va$+MID$(qnb$,INSTR(qnb$," "))
 4200ana$=CHR$224
 4210vb%=vc%:vd%=va%:anb$=ms$
 4220IFvb%=vd%THENvb%=1:vd%=1
 4230IFvb%MODvd%=0THENvb%=vb%/vd%:vd%=1
 4240IFvd%MODvb%=0THENvd%=vd%/vb%:vb%=1
 4245IFunb%>1THEN6360
 4247IFva%*vb%>6THEN4000
 4250IFvb%<>1THENanb$=anb$+STR$(vb%)
 4260anb$=anb$+ns$
 4270IFvd%<>1THENanb$=anb$+STR$(vd%)
 4280RETURN
 4400PRINTTAB(5,11)"Numbers will automatically be"
 4410PRINTTAB(2,13)"placed as subscripts below the line"
 4420sb%=TRUE:RETURN
 4500PRINTTAB(4,11);
 4510IFINSTR(uan$,"1")THENPRINT"When only one atom of an element"TAB(4,13)"is involved, the subscript 1 is"TAB(10,15)"omitted - Try again":RETURN
 4520IFINSTR(uan$,ns$)<INSTR(uan$,ms$)ANDINSTR(uan$,ns$)<>FALSE THENPRINT"The symbol for the metallic part"TAB(2,13)"of the compound always comes before"TAB(2,15)"the non metal's symbol - Try again":RETURN
 4540IFINSTR(uan$,ns$)<>FALSE ANDINSTR(uan$,ms$)<>FALSE THENPRINTCHR$127;CHR$127;CHR$127"The subscripts are wrong.Valencies are"TAB(13,13);mn$;TAB(23,13)"= "va%;TAB(13,14);nn$;TAB(23,14)"= "vc%:RETURN
 4600PRINT"Look again at the element symbols"TAB(13,13);mn$;TAB(23,13)"= "ms$;TAB(13,14);nn$;TAB(23,14)"= "ns$:RETURN
 4800PRINTTAB(7,24)"A full explanation follows"
 4810PRINTTAB(6,28)"Press SPACE BAR to continue"
 4820IFGET$<>" "THEN4820
 4830VDU28,0,31,39,7:CLS:VDU26
 4831VDU19,1,3,0,0,0
 4835MOVE0,800:GCOL0,0:DRAW1279,800:GCOL0,1
 4840FORlp%=1TOva%*vb%
 4850PROCsquare(4,4,320,774-lp%*76)
 4860NEXT
 4865VDU5
 4870FORlp%=1TOvb%
 4880PROCcircle(36,160,736-lp%*76*va%+38*va%)
 4881FORlpb%=0TOva%-1:MOVE160,736-lp%*76*va%+38*va%:DRAW320,698-((lp%-1)*va%+lpb%)*76:NEXT
 4890MOVE128,748-lp%*76*va%+38*va%:GCOL0,0:PRINTms$:GCOL0,1
 4900NEXT
 4910FORlp%=1TOvd%
 4920PROCcircle(36,480,736-lp%*76*vc%+38*vc%)
 4921FORlpb%=0TOvc%-1:MOVE480,736-lp%*76*vc%+38*vc%:DRAW320,698-((lp%-1)*vc%+lpb%)*76:NEXT
 4930MOVE448,748-lp%*76*vc%+38*vc%:GCOL0,0:PRINTns$:GCOL0,1
 4940NEXT:VDU4
 4972PRINTTAB(21,10)"Note that there are"TAB(21,12)"no free valencies &"TAB(23,14)"so the molecule"TAB(23,16)"is now complete"
 4976IFvd%=1ORvb%=1THENPRINTTAB(1,20)"The no. of atoms is only"TAB(1,22)"shown when larger than 1":PROCbox(0,272,832,400)
 4978PRINTTAB(2,24)"The number of atoms is"TAB(1,26)"shown as a subscript, so"
 4980PRINTTAB(2,28)"the correct formula is"
 4982PROCsbs(anb$,320,64)
 4986VDU4
 4988RETURN
 5000 
 5010RESTORE30070
 5015rq%=RND(13)
 5020IFRND(2)=2THEN5200
 5040IFFNused(rq%+5000)=TRUE THEN5015
 5050ca%(qn%)=rq%+5000
 5060FORlp%=1TOrq%
 5070READqnb$,ana$,va%
 5080NEXT:anb$=CHR$244
 5100qna$="Formula of the RADICAL"
 5110sb%=TRUE
 5120RETURN
 5200IFFNused(rq%+5050)=TRUE THEN5015
 5220ca%(qn%)=rq%+5050
 5230FORlp%=1TOrq%
 5240READqnb$,s$,ana$
 5250NEXT
 5260qna$="Valency of the RADICAL"
 5270anb$=CHR$224:sb%=FALSE
 5280RETURN
 5400PRINTTAB(4,11)"This unit contains questions on"
 5410PRINTTAB(3,13)"formulae & valencies of radicals"
 5420sb%=TRUE:RETURN
 5500IFuan$=STR$(VAL(uan$))ANDsb%=TRUE THENPRINTTAB(15,12)"FORMULA !"TAB(10,14)"- not the valency":RETURN
 5501IFuan$<>STR$(VAL(uan$))ANDsb%=FALSE THENPRINTTAB(15,12)"VALENCY !"TAB(10,14)"- not the formula":RETURN
 5510PRINTTAB(15,13)"Try again"
 5530RETURN
 5800PRINTTAB(2,24)"Bad luck : The correct"
 5805IFsb%=FALSE THENPRINTTAB(2,26)"valency of the radical"TAB(11,28)"is "ana$:RETURN
 5810PRINTTAB(2,26)"formula of the radical"TAB(9,28)"is"
 5860PROCsbs(ana$,400,124)
 5870VDU4
 5880RETURN
 6000 
 6010unb%=RND(4)
 6020IFunb%=1THEN4000
 6030sb%=TRUE
 6040IFunb%=3THEN6100
 6045IFRND(3)<>1THEN6000
 6050RESTORE30070
 6060READmn$,ms$,va%
 6065rq%=20
 6070qna$=mn$
 6080GOTO6150
 6100RESTORE
 6110rq%=RND(14)
 6120FORlp%=1TOrq%
 6125READmn$,ms$,va%,vb%
 6130NEXT
 6135IFva%=vb%THENqna$=mn$:GOTO6150
 6140IFRND(4)=1THENva%=vb%
 6141RESTORE30500
 6142FORlp%=1TOva%:READva$:NEXT
 6145qna$=mn$+" "+va$
 6150IFunb%=2THEN6200
 6160RESTORE30080:IFrq%=18THEN6000
 6161IFrq%=1ORrq%=2THENrb%=RND(10):GOTO6165
 6162IFrq%>3ANDrq%<7THENrb%=RND(12):GOTO6165
 6163IFrq%<10THENrb%=RND(7):GOTO6165
 6164IFrq%>15THENrb%=RND(7)ELSErb%=RND(3)
 6165FORlp%=1TOrb%
 6167READnn$,ns$,vc%:NEXT
 6170qnb$=nn$
 6171IFva%=4ANDvc%=3THEN6160
 6172IFFNused(rq%-((unb%=2ORunb%=4)*15)*100+rb%)=TRUE THEN6010
 6173ca%(qn%)=rq%-((unb%=2ORunb%=4)*15)*100+rb%
 6190GOTO4200
 6200rb%=RND(4):RESTORE30040
 6201IFFNused(rq%-((unb%=2ORunb%=4)*15)*100+rb%+20)=TRUE THEN6010
 6202ca%(qn%)=rq%-((unb%=2ORunb%=4)*15)*100+rb%+20
 6203FORlp%=1TOrb%
 6204READnn$,ns$,vc%,vd%:NEXT
 6206FORlp%=LEN(nn$)-1TO3STEP-1
 6208IFMID$(nn$,lp%,1)="y"ORMID$(nn$,lp%,1)="i"ORMID$(nn$,lp%,1)="o"ORMID$(nn$,lp%,1)="u"THEN qnb$=LEFT$(nn$,lp%-1)+"ide":lp%=3
 6210NEXT
 6350GOTO4200
 6355IFva%*vb%>6THEN6000
 6360IFvb%>1ANDunb%<>3THENanb$="("+ms$+")"+STR$(vb%)ELSEanb$=ms$
 6365IFvb%>1ANDunb%=3THENanb$=anb$+STR$(vb%)
 6370IFvd%<>1ANDunb%>2THENanb$=anb$+"("+ns$+")"+STR$(vd%)ELSEanb$=anb$+ns$
 6375IFvd%>1ANDunb%=2THENanb$=anb$+STR$(vd%)
 6380RETURN
 6400PRINTTAB(1,10)"Brackets can be obtained by pressing"
 6410PRINTTAB(13,12)"with      for  ("
 6420PRINTTAB(13,14)"with      for  )"TAB(1,14)"or"
 6430PROCkey("SH",144,640):PROCkey("8",592,640):PROCkey("SH",144,576):PROCkey("9",592,576)
 6440sb%=TRUE:RETURN
 6500IFunb%=1THEN4500
 6530IFINSTR(uan$,ns$)<INSTR(uan$,ms$)ANDINSTR(uan$,ns$)THENPRINTTAB(1,11)"The symbol for the metallic part (":PROCsbs(ms$+")",1120,668):VDU4:PRINTTAB(2,13)"of the compound always comes before"
 6540IFINSTR(uan$,ns$)<INSTR(uan$,ms$)ANDINSTR(uan$,ns$)THENPRINTTAB(0,15)"the non metallic symbol (":PROCsbs(ns$+").",800,540):VDU4:PRINTTAB(31,15)"Try again":RETURN
 6550IFINSTR(uan$,ns$)=FALSE ORINSTR(uan$,ms$)=FALSE THENPRINTTAB(5,11)"The correct formula/symbol for"ELSEGOTO6590
 6560 PRINTTAB(20-LEN(mn$),13)mn$" is";:PROCsbs(ms$,800,602):VDU4
 6570PRINTTAB(20-LEN(nn$),15)nn$" is";:PROCsbs(ns$,800,538)
 6580VDU4:RETURN
 6590IFINSTR(uan$,"1")THENPRINTTAB(4,11)"When only one atom of an element"TAB(4,13)"is involved, the subscript 1 is"TAB(10,15)"omitted - Try again":RETURN
 6600IFINSTR(uan$,"(")=FALSE EORINSTR(uan$,")")=FALSE THENPRINTTAB(8,12)"Try again - but remember"TAB(11,14)"the other bracket":RETURN
 6601uan$=uan$+CHR$244
 6610IF(unb%=2ORunb%=4)ANDASC(MID$(uan$,LEN(ms$)+1,1))>47ANDASC(MID$(uan$,LEN(ms$)+1,1))<58THEN6700
 6620IFunb%>2ANDASC(MID$(uan$,INSTR(uan$,ns$)+LEN(ns$),1))>47ANDASC(MID$(uan$,INSTR(uan$,ns$)+LEN(ns$),1))<58THEN6700
 6630PRINTTAB(0,11)"Your subscripts are wrong. Valencies are"TAB(9,13)mn$;STRING$(20-LEN(mn$),".");va%
 6640PRINTTAB(9,14)nn$;STRING$(20-LEN(nn$),".");vc%:RETURN
 6700PRINTTAB(1,11)"When a radical is used more than once"TAB(1,13)"in a molecule, the radical's formula"TAB(1,15)"is put in brackets, and subscript after":RETURN
 6799RETURN
 6800IFunb%=1THEN4800
 6820PRINTTAB(7,24)"A full explanation follows"
 6830PRINTTAB(6,28)"Press SPACE BAR to continue";
 6840IFGET$<>" "THEN6840
 6849REM(C)BOBFINEAN1984
 6850VDU28,0,31,39,7:CLS:VDU26
 6855VDU19,1,3,0,0,0
 6860MOVE0,800:GCOL0,0:DRAW1279,800:GCOL0,1
 6870FORlp%=1TOva%*vb%
 6880PROCsquare(4,4,320,774-lp%*76)
 6890NEXT
 6900VDU5
 6910FORlp%=1TOvb%
 6920IFunb%=2ORunb%=4THENPROCsquare(72,28,144,736-lp%*76*va%+38*va%)ELSEPROCcircle(36,160,736-lp%*76*va%+38*va%)
 6930FORlpb%=0TOva%-1:MOVE160,736-lp%*76*va%+38*va%:DRAW320,698-((lp%-1)*va%+lpb%)*76:NEXT
 6940MOVE128,748-lp%*76*va%+38*va%:GCOL0,0:IFunb%=2ORunb%=4THENPROCsbs(ms$,82,756-lp%*76*va%+38*va%)ELSEPRINTms$
 6950GCOL0,1:NEXT
 6952FORlp%=1TOvd%
 6954IFunb%>2THENPROCsquare(72,28,512,736-lp%*76*vc%+38*vc%)ELSEPROCcircle(36,480,736-lp%*76*vc%+38*vc%)
 6956FORlpb%=0TOvc%-1:MOVE480,736-lp%*76*vc%+38*vc%:DRAW320,698-((lp%-1)*vc%+lpb%)*76:NEXT
 6958MOVE448,748-lp%*76*vc%+38*vc%:GCOL0,0:IFunb%>2THENPROCsbs(ns$,448,756-lp%*76*vc%+38*vc%)ELSEPRINTns$
 6960GCOL0,1:NEXT:VDU4
 6962PRINTTAB(22,9)"Notice that the"TAB(20,11)"radicals are treated"
 6964PRINTTAB(20,13)"in exactly the same"TAB(22,15)"way as elements"
 6966IFvb%>1ORvd%>1THENPRINTTAB(0,22)"If a subscript is required"TAB(3,24)"after a radical, the"
 6968IFvb%>1ORvd%>1THENPRINTTAB(0,26)"radical must be surrounded"TAB(0,28)"by brackets. The answer is":PROCsbs(anb$,256,48)
 6970IFvb%=1ANDvd%=1THENPRINTTAB(5,22)"So the correct"TAB(7,24)"formula is":PROCsbs(anb$,312,192)
 6980VDU4
 6999RETURN
 7000 
 7010unb%=RND(3)
 7020IFunb%=1THEN3000
 7030IFunb%=2THEN5000
 7035sb%=TRUE
 7040rq%=RND(9)
 7041IFFNused(rq%+6000)=TRUE THEN7010
 7042ca%(qn%)=rq%+6000
 7050RESTORE30510:FORlp%=1TOrq%
 7060READvl%:NEXT
 7070RESTORE30040
 7080FORlp%=1TOvl%:READqnb$,ns$,va%,vb%:NEXT
 7090IFva%>0THENana$=ns$+"2"ELSEana$=ns$
 7100qna$="The formula of the GAS"
 7110anb$=CHR$224:RETURN
 7400PRINTTAB(5,10)"This unit contains questions"
 7410PRINTTAB(8,12)"from units 1, 2 & 5, and"
 7420PRINTTAB(7,14)"on the formulae of gasses"
 7430sb%=TRUE:RETURN
 7500IFunb%=1THEN3500
 7510IFunb%=2THEN5500
 7511IFINSTR(uan$,ns$)=FALSE THENPRINTTAB(8,12)"The symbol for "qnb$TAB(15,14)"is  "ns$:RETURN
 7512IFINSTR(uan$,"1")ANDva%=0THENPRINTTAB(9,12)"The subscript  1  is"TAB(6,14)"never included in a formula":RETURN
 7520IFva%>0ANDINSTR(uan$,"2")=FALSE THENPRINTTAB(10,12)"There are two atoms in"TAB(6,14)"a molecule of a DIATOMIC gas":RETURN
 7530IFINSTR(uan$,"2")ANDva%=0THENPRINTTAB(7,12)"There is only one atom in a"TAB(8,14)"molecule of an INERT gas":RETURN
 7540PRINTTAB(15,13)"Try again":RETURN
 7800IFunb%=1THEN3800
 7810IFunb%=2THEN5800
 7811IFva%=0THENPROCcircle(50,420,276):VDU5:GCOL0,0:MOVE388,284:PRINTana$:GOTO7820
 7812PROCcircle(50,300,276):PROCcircle(50,540,276):MOVE300,276
 7813IFva%=1THENDRAW540,276
 7814IFva%=2THENDRAW420,300:DRAW540,276:DRAW420,252:DRAW300,276
 7815IFva%=3THENDRAW420,326:DRAW540,276:DRAW300,276:DRAW420,226:DRAW540,276
 7816VDU5:GCOL0,0:MOVE268,284:PRINTLEFT$(ana$,LEN(ana$)-1):MOVE508,284:PRINTLEFT$(ana$,LEN(ana$)-1)
 7820GCOL0,1:VDU4:PRINTTAB(2,27)"Bad luck : The correct"
 7830PRINTTAB(6,30)"formula is":PROCsbs(ana$,544,62):VDU4:RETURN
10000DEFPROCsbs(cs$,lx%,ly%)
10001LOCALlp%,ps$,sp%
10002VDU5:MOVElx%,ly%:FORlp%=1TOLEN(cs$)
10003IFASC(MID$(cs$,lp%,1))>47ANDASC(MID$(cs$,lp%,1))<58THENPROCpsb(MID$(cs$,lp%,1))ELSEPRINTMID$(cs$,lp%,1);
10004NEXT:lx%=lx%+lp%*32
10005ENDPROC
10009DEFPROCpsb(ps$)
10050MOVElx%+lp%*32-32,ly%-16:PRINTps$:MOVElx%+lp%*32,ly%
10060ENDPROC
11000DEFFNups(us$)
11001LOCALlp%,ps$:ps$=""
11010FORlp%=1TOLEN(us$)
11020IFASC(MID$(us$,lp%,1))>122ORASC(MID$(us$,lp%,1))<97THENps$=ps$+MID$(us$,lp%,1)ELSEps$=ps$+CHR$(ASC(MID$(us$,lp%,1))-32)
11030NEXT
11040=ps$
12000DEFFNgpi(ln%,sb%,lx%,ly%)
12010LOCALis%,il%,ps$,lxs%
12015VDU5:MOVElx%,ly%
12020gi$="":is%=0:lxs%=lx%
12030is%=is%+1:lx%=lxs%+(is%*32-32):gi$(is%)=GET$
12032IFASC(gi$(is%))>32ANDASC(gi$(is%))<40THENgi$(is%)=CHR$(ASC(gi$(is%))+16)
12035IFis%>ln%ANDgi$(is%)<>CHR$127ANDgi$(is%)<>CHR$13THENis%=is%-1:GOTO12030
12040IFis%<2ANDgi$(is%)=CHR$127THENis%=is%-1:GOTO12030
12050IFis%>1ANDgi$(is%)=CHR$127THENis%=is%-2:GCOL0,0:MOVElx%-32,ly%-16:PRINTCHR$227:MOVElx%-32,ly%:PRINTCHR$227;CHR$127;:GCOL0,1:GOTO12030
12060IFASC(gi$(is%))<33ANDASC(gi$(is%))<>13ORASC(gi$(is%))>117THENis%=is%-1:GOTO12030
12070IFsb%=TRUE ANDASC(gi$(is%))>47ANDASC(gi$(is%))<58THENPROCsbs(gi$(is%),lx%,ly%):GOTO12030
12075IFgi$(is%)=CHR$13ANDis%=1THENis%=0:GOTO12030
12080PRINTgi$(is%);
12090IFgi$(is%)=CHR$13THEN12120
12110GOTO12030
12120FORlp%=1TOis%-1
12130ps$=ps$+gi$(lp%)
12140NEXT
12145VDU4
12150=ps$
13000DEFPROCbox(lft%,btm%,rt%,tp%)
13010MOVElft%,tp%:DRAWrt%,tp%
13020DRAWrt%,btm%:DRAWlft%,btm%
13030DRAWlft%,tp%:ENDPROC
14000DEFPROCcircle(r%,cx%,cy%)
14010LOCALlp%
14025y%=r%/SQR(2):x%=y%
14030PROCsquare(x%,y%,cx%,cy%)
14031VDU29,cx%;cy%;
14035FORlp%=x%+4 TO r% STEP 4
14036Y%=SQR(r%*r%-lp%*lp%)
14037MOVElp%,Y%:DRAWlp%,-Y%
14038MOVE-lp%,Y%:DRAW-lp%,-Y%
14039MOVEY%,lp%:DRAW-Y%,lp%
14040MOVEY%,-lp%:DRAW-Y%,-lp%
14041NEXT:VDU29,0;0;:ENDPROC
15000DEFPROCsquare(xr%,yr%,x%,y%)
15010VDU24,x%-xr%;y%-yr%;x%+xr%;y%+yr%;
15020GCOL0,129:CLG:GCOL0,128:VDU26
15030ENDPROC
16000DEFPROCkey(ps$,x%,y%)
16001PROCsquare(48,18,x%+48,y%-12)
16002IFps$="SH"THENPROCsquare(32,18,x%+128,y%-12)
16010GCOL0,0
16011MOVEx%,y%
16012VDU5
16015IFps$="SH"THENPRINT"SHIFT":GOTO16035
16017IFps$="CL"THENVDU234,235,236:GOTO16035
16018IFps$="SL"THENVDU231,232,233:GOTO16035
16020IFps$="ES"THENVDU224,225,226:GOTO16035
16030PRINT" ";ps$
16035VDU4:GCOL4,1
16050MOVEx%-8,y%+14:PLOT13,x%-8,y%-44
16051IFps$<>"SH"THENPLOT13,x%+104,y%-44:PLOT13,x%+104,y%+14:GOTO16060
16052PLOT13,x%+168,y%-44:PLOT13,x%+168,y%+14
16060PLOT13,x%-8,y%+14:GCOL0,1:ENDPROC
17000DEFPROCgbox(lft%,btm%,rt%,tp%)
17010MOVElft%,tp%:PLOT21,rt%,tp%
17020PLOT21,rt%,btm%:PLOT21,lft%,btm%
17030PLOT21,lft%,tp%:ENDPROC
18000DEFPROCclearbox
18010GCOL0,0:PROCbox(80,780-un%*64,1199,852-un%*64):GCOL0,1
18020PRINTTAB(3,6+un%*2);"   ";:ENDPROC
19000DEFFNused(qt%)
19010FORlp%=1TOqn%:IFca%(lp%)=qt%THENlp%=100
19020NEXT:IFlp%>99THEN =TRUE ELSE =FALSE
30000DATACalcium,Ca,2,2,Magnesium,Mg,2,2,Copper,Cu,1,2,Sodium,Na,1,1
30001DATAPotassium,K,1,1,Lithium,Li,1,1,Barium,Ba,2,2,Iron,Fe,2,3
30002DATAZinc,Zn,2,2,Mercury,Hg,1,2,Aluminium,Al,3,3,Manganese,Mn,2,3
30003DATAChromium,Cr,3,2,Tin,Sn,2,4,Silver,Ag,1,2,Nickel,Ni,2,3
30004DATALead,Pb,2,4,Gold,Au,3,1
30040DATAChlorine,Cl,1,1,Sulphur,S,2,4,Iodine,I,1,1,Bromine,Br,1,1
30041DATAOxygen,O,2,2,Fluorine,F,1,1,Nitrogen,N,3,3,Hydrogen,H,1,1
30042DATAPhosphorus,P,3,5,Silicon,Si,4,4,Carbon,C,3,4
30050DATANeon,Ne,0,0,Argon,Ar,0,0,Helium,He,0,0
30070DATAAmmonium,NH4,1
30080DATASulphate,SO4,2,Nitrate,NO3,1,Phosphate,PO4,3,Carbonate,CO3,2
30090DATAHydroxide,OH,1,Chlorate,ClO3,1,Sulphite,SO3,2,Silicate,SiO3,2
30100DATANitrite,NO2,1,Manganate (VII),MnO4,1,Hydrogen sulphate,HSO4,1
30110DATAHydrogen carbonate,HCO3,1
30500DATA(I),(II),(III),(IV)
30510DATA1,4,5,6,7,8,12,13,14
30520DATA255
