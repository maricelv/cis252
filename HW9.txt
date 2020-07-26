-- Homework 9
-- Maricel Vicente
-- bvicente@syr.edu

import Turing

-- Problem 1
hwhhTM :: Prog
hwhhTM = [
            (("start",'w'),('w',Rght,"start")),
            (("start",'h'),('h',Rght,"sawH")),

            (("sawH",'h'),('h',Rght,"start")),
            (("sawH",'w'),('w',Rght,"sawW")),

            (("sawW",'w'),('w',Rght,"start")),
            (("sawW",'h'),('h',Rght,"sawHWH")),

            (("sawHWH",'w'),('w',Rght,"findEnd")),
            (("sawHWH",'h'),('X',Rght,"sawHWH")),

            (("findEnd",'w'),('w',Rght,"findEnd")),
            (("findEnd",'h'),('h',Rght,"findEnd")),
            (("findEnd",'1'),('1',Rght,"findEnd")),
            (("findEnd",' '),('1',Lft,"goback")),

            (("goback",'1'),('1',Lft,"goback")),
            (("goback",'h'),('h',Lft,"goback")),
            (("goback",'w'),('w',Lft,"goback")),
            (("goback",'X'),('h',Rght,"start"))
         ]

-- Problem 2

divis4 :: Prog
divis4 = [
            (("term1",'m'),(' ',Rght,"term1")),
            (("term1",'k'),(' ',Rght,"term2")),
            (("term1",'q'),(' ',Rght,"term2")),
            (("term1",' '),('Y',Rght,"end")),

            (("term2",'m'),(' ',Rght,"term2")),
            (("term2",'k'),(' ',Rght,"term3")),
            (("term2",'q'),(' ',Rght,"term3")),
            (("term2",' '),('N',Rght,"end")),
           
            (("term3",'m'),(' ',Rght,"term3")),
            (("term3",'k'),(' ',Rght,"term4")),
            (("term3",'q'),(' ',Rght,"term4")),
            (("term3",' '),('N',Rght,"end")),

            (("term4",'m'),(' ',Rght,"term4")),
            (("term4",'k'),(' ',Rght,"term1")),
            (("term4",'q'),(' ',Rght,"term1")),
            (("term4",' '),('N',Rght,"end")) ]

-- Problem 3
ddeeTM :: Prog
ddeeTM = [
            (("start",'d'),('d',Rght,"start")),
            (("start",'e'),('X',Rght,"findD")),

            (("findD",'d'),('e',Lft,"replaceD")),
            (("findD",'e'),('e',Rght,"findD")),
            (("findD",' '),(' ',Rght,"findEnd")),

            (("replaceD",'e'),('e',Lft,"replaceD")),
            (("replaceD",' '),(' ',Rght,"findEnd")),
            (("replaceD",'d'),('d',Rght,"start")),
            (("replaceD",' '),(' ',Lft,"start")),
            (("replaceD",'X'),('d',Rght,"start")),

            (("findEnd",'X'),('e',Rght,"start")),
            (("findEnd",'d'),('d',Lft,"findEnd")),
            (("findEnd",'e'),('e',Lft,"start")),
            (("findEnd",' '),(' ',Lft,"start"))

          ]

-- Problem 4

checkNum :: Prog
checkNum = [

            (("start",'1'),(' ',Rght,"start")),
            (("start",'2'),(' ',Rght,"find3")),
            (("start",'3'),(' ',Rght,"find2")),
            (("start",'X'),(' ',Rght,"start")),
            (("start",'Y'),(' ',Rght,"start")),
            (("start",' '),('S',Rght,"end")),

            (("find3",'1'),('1',Rght,"find3")),
            (("find3",'2'),('2',Rght,"find3")),
            (("find3",'X'),('X',Rght,"find3")),
            (("find3",'3'),('X',Lft,"goBack")),
            (("find3",' '),('M',Lft,"return")),

            (("find2",'1'),('1',Rght,"find2")),
            (("find2",'3'),('3',Rght,"find2")),
            (("find2",'Y'),('Y',Rght,"find2")),
            (("find2",'2'),('Y',Lft,"goBack")),
            (("find2",' '),('F',Lft,"return")),

            (("goBack",'1'),('1',Lft,"goBack")),
            (("goBack",'2'),('2',Lft,"goBack")),
            (("goBack",'3'),('3',Lft,"goBack")),
            (("goBack",' '),(' ',Rght,"start")),
            (("goBack",'X'),('X',Lft,"goBack")) ]