const int fn = 240; //Duration of 4 beats
const int hn = 120; //Duration of 2 beats
const int qn = 60; //Duration of 1 beat
const int en = 30;
const int sn = 15;
//const int bpm = 180;

// Define the notes
const int c[9]   = {16, 33, 65, 131, 262, 523, 1047, 2093, 4186};
const int cs[9]  = {17, 35, 69, 139, 277, 554, 1109, 2217, 4435};
const int d[9]   = {18, 37, 73, 147, 294, 587, 1175, 2349, 4699};
const int eb[9]  = {19, 39, 78, 156, 311, 622, 1245, 2489, 4978};
const int e[9]   = {21, 41, 82, 165, 330, 659, 1319, 2637, 5274};
const int f[9]   = {22, 44, 87, 175, 349, 699, 1397, 2794, 5588};
const int fs[9]  = {23, 46, 93, 185, 370, 740, 1480, 2960, 5920};
const int g[9]   = {25, 49, 98, 196, 392, 784, 1568, 3136, 6272};
const int gs[9]  = {26, 52, 104, 208, 415, 831, 1661, 3322, 6645};
const int a[9]   = {28, 55, 110, 220, 440, 880, 1760, 3520, 7040};
const int bb[9]  = {29, 58, 117, 233, 466, 932, 1865, 3729, 7459};
const int b[9]   = {31, 62, 124, 247, 494, 988, 1976, 3951, 7902};
const int r = 25000;

long bpm = 140;
long song[][2] ={
  {b[4]   , qn + en},//2st bar start  | Darude Start * 3
  {b[4]   , qn + en},
  {b[4]   , en},
  {b[4]   , qn + en},
  {b[4]   , qn + en},
  {e[5]   , en},     //2st bar end
  {e[5]   , qn + en},//3nd bar start
  {e[5]   , qn + en},
  {d[5]   , en},
  {d[5]   , qn + en},
  {d[5]   , qn + en},
  {a[4]   , en},     //3nd bar end
  {b[4]   , qn + en},//4rd bar start
  {b[4]   , qn + en},
  {b[4]   , en},
  {b[4]   , qn + en},
  {b[4]   , qn + en},
  {e[5]   , en},     //4rd bar end
  {b[4]   , qn + en},//5th bar start
  {b[4]   , qn + en},
  {b[4]   , en},
  {b[4]   , qn + en},
  {b[4]   , qn + en},
  {e[5]   , en},   //5th bar end
  {b[4]   , qn + en},//6th bar start
  {b[4]   , qn + en},
  {b[4]   , en},
  {b[4]   , qn + en},
  {b[4]   , qn + en},
  {e[5]   , en},     //6th bar end
  {e[5]   , qn + en},//6th bar start
  {e[5]   , qn + en},
  {d[5]   , en},
  {d[5]   , qn + en},
  {d[5]   , qn + en},
  {a[4]   , en},     //6th bar end
  {b[4]   , qn + en},//7th bar start
  {b[4]   , qn + en},
  {b[4]   , en},
  {b[4]   , qn + en},
  {b[4]   , qn + en},
  {e[5]   , en},     //7th bar end
  {b[4]   , qn + en},//8th bar start
  {b[4]   , qn + en},
  {b[4]   , en},
  {b[4]   , qn + en},
  {b[4]   , qn + en},
  {e[5]   , en},   //8th bar end  | Darude Start end
  {b[3]   , sn},//duh_duh_duh_duh_da Start
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},//duh_duh_duh_duh_da end
  {r      , fn + en + qn},
  {d[4]   , qn},//duh_duh_duh_duh_da Start
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},//duh_duh_duh_duh_da end
  {r      , fn + en + qn + fn},
  {b[3]   , sn},//duh_duh_duh_duh_da Start
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},//duh_duh_duh_duh_da end
  {b[3]   , sn},//duh_duh_duh_duh_da Start
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},//duh_duh_duh_duh_da end
  {b[3]   , sn},//duh_duh_duh_duh_da Start
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},//duh_duh_duh_duh_da end
  {b[3]   , sn},//duh_duh_duh_duh_da Start
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},//duh_duh_duh_duh_da end
  {b[3]   , sn},//duh_duh_duh_duh Start
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},//duh_duh_duh_duh end
  {b[3]   , sn},//duh_duh_duh_duh Start
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},//duh_duh_duh_duh end
  {b[3]   , sn},//duh_duh_duh_duh Start
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},//duh_duh_duh_duh end
  {b[3]   , sn},//duh_duh_duh_duh Start
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},//duh_duh_duh_duh end
  {b[3]   , sn},//duh_duh_duh_duh Start
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},//duh_duh_duh_duh end
  {b[3]   , sn},//duh_duh_duh_duh Start
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},//duh_duh_duh_duh end
  {b[3]   , sn},//duh_duh_duh_duh Start
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},//duh_duh_duh_duh end
  {d[4]   , qn},
  {b[3]   , sn},//Darude up
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {e[4]   , sn},
  {e[4]   , sn},//Darude up end
  {e[4]   , sn},//Darude Down
  {e[4]   , sn},
  {e[4]   , sn},
  {e[4]   , sn},
  {e[4]   , en},
  {d[4]   , sn},
  {d[4]   , sn},
  {d[4]   , sn},
  {d[4]   , sn},
  {d[4]   , sn},
  {d[4]   , sn},
  {d[4]   , en},
  {a[3]   , sn},
  {a[3]   , sn},//Darude Down end
  {b[3]   , sn},//Darude up
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {e[4]   , sn},
  {e[4]   , sn},//Darude up end
  {b[3]   , sn},//Darude up
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {e[4]   , sn},
  {e[4]   , sn},//Darude up end
  {b[3]   , sn},//Darude up
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {e[4]   , sn},
  {e[4]   , sn},//Darude up end
  {e[4]   , sn},//Darude Down
  {e[4]   , sn},
  {e[4]   , sn},
  {e[4]   , sn},
  {e[4]   , en},
  {d[4]   , sn},
  {d[4]   , sn},
  {d[4]   , sn},
  {d[4]   , sn},
  {d[4]   , sn},
  {d[4]   , sn},
  {d[4]   , en},
  {a[3]   , sn},
  {a[3]   , sn},//Darude Down end
  {b[3]   , sn},//Darude up
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {e[4]   , sn},
  {e[4]   , sn},//Darude up end
  {b[3]   , sn},//Darude up
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {e[4]   , sn},
  {e[4]   , sn},//Darude up end
  {b[3]   , sn},//Darude up
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {e[4]   , sn},
  {e[4]   , sn},//Darude up end

  {e[4]   , sn},//Darude Down
  {e[4]   , sn},
  {e[4]   , sn},
  {e[4]   , sn},
  {e[4]   , en},
  {d[4]   , sn},
  {d[4]   , sn},
  {d[4]   , sn},
  {d[4]   , sn},
  {d[4]   , sn},
  {d[4]   , sn},
  {d[4]   , en},
  {a[3]   , sn},
  {a[3]   , sn},//Darude Down end
  {b[3]   , sn},//Darude up
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {e[4]   , sn},
  {e[4]   , sn},//Darude up end
  {b[3]   , sn},//Darude up
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {e[4]   , sn},
  {e[4]   , sn},//Darude up end
  {b[3]   , sn},//Darude up
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {e[4]   , sn},
  {e[4]   , sn},//Darude up end
  {e[4]   , sn},//Darude Down
  {e[4]   , sn},
  {e[4]   , sn},
  {e[4]   , sn},
  {e[4]   , en},
  {d[4]   , sn},
  {d[4]   , sn},
  {d[4]   , sn},
  {d[4]   , sn},
  {d[4]   , sn},
  {d[4]   , sn},
  {d[4]   , en},
  {a[3]   , sn},
  {a[3]   , sn},//Darude Down end
  {b[3]   , sn},//Darude up
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {e[4]   , sn},
  {e[4]   , sn},//Darude up end
  {b[3]   , sn},//Darude up
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {e[4]   , sn},
  {e[4]   , sn},//Darude up end

  {b[3]   , sn},//darude_up_duh_da start
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {d[4]   , en},//darude_up_duh_da End
  {b[3]   , sn},//darude_up_da_da start
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {d[4]   , en},
  {d[4]   , en},//darude_up_da_da end
  {b[3]   , sn},//Darude up
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {e[4]   , sn},
  {e[4]   , sn},//Darude up end
  {e[4]   , sn},//Darude Down
  {e[4]   , sn},
  {e[4]   , sn},
  {e[4]   , sn},
  {e[4]   , en},
  {d[4]   , sn},
  {d[4]   , sn},
  {d[4]   , sn},
  {d[4]   , sn},
  {d[4]   , sn},
  {d[4]   , sn},
  {d[4]   , en},
  {a[3]   , sn},
  {a[3]   , sn},//Darude Down end
  {b[3]   , sn},//darude_up_duh_da start
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {d[4]   , en},//darude_up_duh_da End
  {b[3]   , sn},//darude_up_da_da start
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {d[4]   , en},
  {d[4]   , en},//darude_up_da_da end
  {b[3]   , sn},//Darude up
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {e[4]   , sn},
  {e[4]   , sn},//Darude up end
  {e[4]   , sn},//Darude Down
  {e[4]   , sn},
  {e[4]   , sn},
  {e[4]   , sn},
  {e[4]   , en},
  {d[4]   , sn},
  {d[4]   , sn},
  {d[4]   , sn},
  {d[4]   , sn},
  {d[4]   , sn},
  {d[4]   , sn},
  {d[4]   , en},
  {a[3]   , sn},
  {a[3]   , sn},//Darude Down end
  {b[3]   , sn},//darude_up_da_da start
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {d[4]   , en},
  {d[4]   , en},//darude_up_da_da end
  {b[3]   , sn},//darude_up_da_da start
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {d[4]   , en},
  {d[4]   , en},//darude_up_da_da end
  {b[3]   , sn},//darude_up_da_da start
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {d[4]   , en},
  {d[4]   , en},//darude_up_da_da end
  {b[3]   , sn},//darude_up_da_da start
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , en},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {b[3]   , sn},
  {d[4]   , en},
  {d[4]   , en},//darude_up_da_da end
  {b[3]   , sn},//duh_duh_duh_da_da start
  {b[3]   , sn},
  {b[3]   , en},
  {d[4]   , en},
  {d[4]   , en},//duh_duh_duh_da_da end
  {b[3]   , sn},//duh_duh_duh_da_da start
  {b[3]   , sn},
  {b[3]   , en},
  {d[4]   , en},
  {d[4]   , en},//duh_duh_duh_da_da end
  {b[3]   , sn},//duh_duh_duh_da_da start
  {b[3]   , sn},
  {b[3]   , en},
  {d[4]   , en},
  {d[4]   , en},//duh_duh_duh_da_da end
  {b[3]   , sn},//duh_duh_duh_da_da start
  {b[3]   , sn},
  {b[3]   , en},
  {d[4]   , en},
  {d[4]   , en},//duh_duh_duh_da_da end
  {b[3]   , sn},//duh_duh_da start
  {b[3]   , sn},
  {d[4]   , en},//duh_duh_da end
  {b[3]   , sn},//duh_duh_da start
  {b[3]   , sn},
  {d[4]   , en},//duh_duh_da end
  {b[3]   , sn},//duh_duh_da start
  {b[3]   , sn},
  {d[4]   , en},//duh_duh_da end
  {b[3]   , sn},//duh_duh_da start
  {b[3]   , sn},
  {d[4]   , en},//duh_duh_da end
  {b[3]   , sn},//duh_duh_da start
  {b[3]   , sn},
  {d[4]   , en},//duh_duh_da end
  {b[3]   , sn},//duh_duh_da start
  {b[3]   , sn},
  {d[4]   , en},//duh_duh_da end
  {b[3]   , sn},//duh_duh_da start
  {b[3]   , sn},
  {d[4]   , en},//duh_duh_da end
  {b[3]   , sn},//duh_duh_da start
  {b[3]   , sn},
  {d[4]   , en},//duh_duh_da end
  {e[5]   , fn}
};
