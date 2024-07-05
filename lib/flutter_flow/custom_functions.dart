import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<DateTime> getLastSevenDays() {
  // based off of today's date, return a list of all dates from the past seven days including today
  List<DateTime> dates = [];
  DateTime now = DateTime.now();
  for (int i = 7; i >= 0; i--) {
    dates.add(now.subtract(Duration(days: i)));
  }
  return dates;
}

PhaseAndConfidenceStruct phaseDeterminator(
  List<String> listOfMoods,
  DateTime dateOfLastCycle,
  DateTime dateOfSurvey,
) {
  int menstruationPts = 0;
  int follicularPts = 0;
  int ovulationPts = 0;
  int lutealPts = 0;

  // Add points to menstrual
  if (listOfMoods.contains("Irritable")) {
    menstruationPts++;
  }
  if (listOfMoods.contains("Tired")) {
    menstruationPts++;
  }
  if (listOfMoods.contains("Moody")) {
    menstruationPts++;
  }
  if (listOfMoods.contains("Depressed")) {
    menstruationPts++;
  }
  if (listOfMoods.contains("Anxious")) {
    menstruationPts++;
  }
  if (listOfMoods.contains("Angry")) {
    menstruationPts++;
  }

  // Add points to follicular
  if (listOfMoods.contains("Relaxed")) {
    follicularPts++;
  }
  if (listOfMoods.contains("Social")) {
    follicularPts++;
  }
  if (listOfMoods.contains("Empathetic")) {
    follicularPts++;
  }
  if (listOfMoods.contains("Aroused")) {
    follicularPts++;
  }
  if (listOfMoods.contains("Energized")) {
    follicularPts++;
  }
  if (listOfMoods.contains("Clear-minded")) {
    follicularPts++;
  }
  if (listOfMoods.contains("Happy")) {
    follicularPts++;
  }

  // Add points to ovulation
  if (listOfMoods.contains("Fickle")) {
    ovulationPts++;
  }
  if (listOfMoods.contains("Social")) {
    ovulationPts++;
  }
  if (listOfMoods.contains("Emotional")) {
    ovulationPts++;
  }
  if (listOfMoods.contains("Aroused")) {
    ovulationPts++;
  }
  if (listOfMoods.contains("Happy")) {
    ovulationPts++;
  }
  if (listOfMoods.contains("Anxious")) {
    ovulationPts++;
  }
  if (listOfMoods.contains("Confident")) {
    ovulationPts++;
  }

  // Add points to luteal
  if (listOfMoods.contains("Distressed")) {
    lutealPts++;
  }
  if (listOfMoods.contains("Irritable")) {
    lutealPts++;
  }
  if (listOfMoods.contains("Depressed")) {
    lutealPts++;
  }
  if (listOfMoods.contains("Contemplative")) {
    lutealPts++;
  }
  if (listOfMoods.contains("Sad")) {
    lutealPts++;
  }
  if (listOfMoods.contains("Moody")) {
    lutealPts++;
  }
  if (listOfMoods.contains("Angry")) {
    lutealPts++;
  }
  if (listOfMoods.contains("Absent-minded")) {
    lutealPts++;
  }

  // Current Date
  DateTime now = DateTime.now();

  // Days since last cycle
  int surveyDaysPassed = now.difference(dateOfSurvey).inDays;
  int daysPassed = now.difference(dateOfLastCycle).inDays + surveyDaysPassed;
  String determined = '';
  int realPts = 0;

  if (daysPassed <= 3) {
    menstruationPts += 10;
  } else if (daysPassed <= 5) {
    menstruationPts += 5;
    follicularPts += 3;
  } else if (daysPassed <= 7) {
    menstruationPts += 2;
    follicularPts += 3;
  } else if (daysPassed <= 10) {
    follicularPts += 7;
  } else if (daysPassed <= 14) {
    follicularPts += 5;
    ovulationPts += 3;
  } else if (daysPassed <= 16) {
    ovulationPts += 5;
    lutealPts += 2;
  } else if (daysPassed <= 21) {
    ovulationPts += 2;
    lutealPts += 5;
  } else {
    lutealPts += 10;
  }

  // Determining the phase
  if (menstruationPts >= follicularPts &&
      menstruationPts >= ovulationPts &&
      menstruationPts >= lutealPts) {
    determined = 'MENSTRUATION';
    realPts = menstruationPts;
  }
  if (follicularPts >= menstruationPts &&
      follicularPts >= ovulationPts &&
      follicularPts >= lutealPts) {
    determined = 'FOLLICULAR';
    realPts = follicularPts;
  }
  if (ovulationPts >= follicularPts &&
      ovulationPts >= menstruationPts &&
      ovulationPts >= lutealPts) {
    determined = 'OVULATION';
    realPts = ovulationPts;
  }
  if (lutealPts >= follicularPts &&
      lutealPts >= ovulationPts &&
      lutealPts >= menstruationPts) {
    determined = 'LUTEAL';
    realPts = lutealPts;
  }

  // Days since curvey was taken

  if (surveyDaysPassed <= 2) {
    realPts += 10; // total 26
  } else if (surveyDaysPassed <= 5) {
    realPts += 7; // total 24
  } else if (surveyDaysPassed <= 8) {
    realPts += 3; // total 22
  } else if (surveyDaysPassed <= 11) {
    realPts += 1; // total 28
  }
  double percentage;

  // Determining percentage confidence
  if (determined == 'MENSTRUATION') {
    percentage = realPts / 27;
  } else if (determined == 'FOLLICULAR') {
    percentage = realPts / 25;
  } else if (determined == 'OVULATION') {
    percentage = realPts / 23;
  } else if (determined == 'LUTEAL') {
    percentage = realPts / 29;
  } else {
    percentage = realPts / 29;
  }

  return PhaseAndConfidenceStruct(phase: determined, confidence: percentage);
}

List<FunFactsStruct> allFunFacts() {
  // ************ PRIYANKA PLEASE READ THIS *****************/
  // I already did the first fact. Start with the second one.
  // Rephrase them however you want (ex. did you know...?)
  // they can be all lower case or capitalized whatever you think will be cute for fun facts
  // The categories from the doc can serve as tags. You can also add whatever tags you want
  // There is ,tag1, tag2, tag3 so up to 3 tags
  // Phase has to be Menstruation, Follicular, Ovulation, Luteal
  // ***************************************************/
  return [
    createFunFactsStruct(
      phase: 'Menstruation',
      fact:
          'The menstruation phase is the best time for reflection and evaluation of the past month.',
      tag1: 'productivity',
      // not adding the third tag cus we don't need it. only add when needed
      // if needed it would be like tag3: 'something',
    ),
    createFunFactsStruct(
      phase: 'Menstruation',
      fact: 'The menstruation phase lasts 3 to 7 days.',
      tag1: 'cycle',
    ),
    createFunFactsStruct(
      phase: 'Menstruation',
      fact:
          'Symptoms of the menstrual cycle include cramps, fatigue, hormonal changes, and mood swings.',
      tag1: 'cycle',
    ),
    createFunFactsStruct(
      phase: 'Menstruation',
      fact:
          'The uterine lining sheds, constituting uterine blood and tissue through the vagina.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Menstruation',
      fact:
          'The color of menstrual blood varies from bright red to dark brown which is important in indicating hormonal changes and health.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Menstruation',
      fact: 'Fluctuating hormone levels affect mood and hunger cravings.',
      tag1: 'product',
    ),
    createFunFactsStruct(
      phase: 'Menstruation',
      fact:
          'Foods rich in iron, magnesium, calcium, and protein help relieve menstrual symptoms.',
      tag1: 'product',
    ),
    createFunFactsStruct(
      phase: 'Menstruation',
      fact: 'Throughout the menstrual phase, you lose 20mL to 90mL of blood.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Menstruation',
      fact: 'Periods begin at around the age of 12 years old.',
      tag1: 'cycle',
    ),
    createFunFactsStruct(
      phase: 'Menstruation',
      fact:
          'You stop having periods between the age of your mid-40s to mid-50s.',
      tag1: 'cycle',
    ),
    createFunFactsStruct(
      phase: 'Menstruation',
      fact: 'Heat helps relieve period cramps.',
      tag1: 'product',
    ),
    createFunFactsStruct(
      phase: 'Menstruation',
      fact:
          'Hormonal fluctuations during the menstrual phase can cause acne breakouts.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Menstruation',
      fact: 'Body requires more iron to compensate for blood loss.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Menstruation',
      fact:
          'Levels of estrogen and progesterone are at their lowest, triggering your uterine lining to shed.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Menstruation',
      fact:
          'Hormonal fluctuations during the menstrual phase can cause PMS or PMDD.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Menstruation',
      fact: 'Tampons are best used for active occasions such as sports.',
      tag1: 'product',
    ),
    createFunFactsStruct(
      phase: 'Menstruation',
      fact: 'Menstrual cups are best used for longer use and reducing waste.',
      tag1: 'product',
    ),
    createFunFactsStruct(
      phase: 'Menstruation',
      fact: 'Pads are best used for daily wear and overnight use.',
      tag1: 'product',
    ),
    createFunFactsStruct(
      phase: 'Menstruation',
      fact:
          'Low levels of progesterone due to the menstrual phase makes it harder for you to sleep or stay asleep.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Menstruation',
      fact:
          'Low levels of estrogen due to the menstrual phase affect sleep quality.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Menstruation',
      fact: 'The menstrual phase resets the body\'s preparation for pregnancy.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Menstruation',
      fact: 'The menstrual phase happens about every 28 days.',
      tag1: 'cycle',
    ),
    createFunFactsStruct(
      phase: 'Menstruation',
      fact:
          'The McClintock effect is a theory that suggests period syncs occur among women who are often in close proximity to each other',
      tag1: 'cycle',
    ),
    createFunFactsStruct(
      phase: 'Menstruation',
      fact:
          'Emotional intelligence is at its highest during the menstrual phase.',
      tag1: 'product',
    ),
    createFunFactsStruct(
      phase: 'Menstruation',
      fact: 'Common cravings include sweets, salty foods, and carbs.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Menstruation',
      fact:
          'Drinking water during your periods reduces the duration of the menstrual phase and pain intensity.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Follicular',
      fact:
          'The follicular phase starts on the first day of your period and lasts for 13 to 14 days, ending in ovulation.',
      tag1: 'cycle',
    ),
    createFunFactsStruct(
      phase: 'Follicular',
      fact:
          'The follicular phase is the longest phase of your menstrual cycle.',
      tag1: 'cycle',
    ),
    createFunFactsStruct(
      phase: 'Follicular',
      fact:
          'You may feel the most energized, sociable, clear minded, and happy during this cycle.',
      tag1: 'product',
    ),
    createFunFactsStruct(
      phase: 'Follicular',
      fact: 'Your uterus lining also thickens in preparation for pregnancy.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Follicular',
      fact:
          'The transition from the follicular phase to the mid-luteal phase, it can be more difficult to fall asleep and stay asleep.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Follicular',
      fact:
          'During the follicular phase, the maturation of ovarian follicles to prepare one of them for release during ovulation.',
      tag1: 'cycle',
    ),
    createFunFactsStruct(
      phase: 'Follicular',
      fact:
          'Feel free to attack higher-intensity workouts that build fitness, as well as focus on resistance training to build muscle.',
      tag1: 'cycle',
    ),
    createFunFactsStruct(
      phase: 'Follicular',
      fact:
          'The follicular phase is a great time for socializing, exercising, or trying new things.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Follicular',
      fact:
          'In terms of nutrition, focus on eating protein-rich foods during the follicular phase.',
      tag1: 'product',
    ),
    createFunFactsStruct(
      phase: 'Follicular',
      fact:
          'During the follicular phase, the maturation of ovarian follicles to prepare one of them for release during ovulation.',
      tag1: 'cycle',
    ),
    createFunFactsStruct(
      phase: 'Follicular',
      fact:
          'Feel free to attack higher-intensity workouts that build fitness, as well as focus on resistance training to build muscle.',
      tag1: 'product',
    ),
    createFunFactsStruct(
      phase: 'Follicular',
      fact:
          'The follicular phase is a great time for socializing, exercising, or trying new things.',
      tag1: 'product',
    ),
    createFunFactsStruct(
      phase: 'Follicular',
      fact:
          'In terms of nutrition, you should focus on eating protein-rich foods during the follicular phase.',
      tag1: 'product',
    ),
    createFunFactsStruct(
      phase: 'Follicular',
      fact:
          'During the follicular phase, your estrogen hormone levels increase.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Follicular',
      fact:
          'The pituitary gland in your brain releases a hormone to stimulate the production of follicles on the surface of an ovary. Usually, only one follicle will mature into an egg.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Follicular',
      fact:
          'In the follicular phase, try adding in choline, antioxidants, and liver support.',
      tag1: 'product',
    ),
    createFunFactsStruct(
      phase: 'Follicular',
      fact:
          'During the follicular phase, pumpkin seeds and flax seeds can help improve your estrogen levels while preventing an excess amount.',
      tag1: 'product',
    ),
    createFunFactsStruct(
      phase: 'Follicular',
      fact:
          'The follicular phase starts with day one of your cycle. You\'ve recently lost some blood, so your body needs more iron.',
      tag1: 'cycle',
    ),
    createFunFactsStruct(
      phase: 'Follicular',
      fact:
          'A woman\'s ability to recognize angry expressions declines during the late follicular phase when the estrogen level is higher. ',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Follicular',
      fact:
          'Most women feel energetic and happier during the follicular phase than most other phases of the menstrual cycle.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Follicular',
      fact:
          'Complex carbs like whole grains and sweet potatoes are freate for boosting energy levels during the follicular phase.',
      tag1: 'product',
    ),
    createFunFactsStruct(
      phase: 'Follicular',
      fact:
          'In the follicular phase, dandelion root tea is a great drink choice.',
      tag1: 'product',
    ),
    createFunFactsStruct(
      phase: 'Follicular',
      fact:
          'Foods like avocado, vegetables (especially seaweeds), and small amounts of organic animal protein can be helpful in building up your system for the next phase of the cycle.',
      tag1: 'product',
    ),
    createFunFactsStruct(
      phase: 'Follicular',
      fact: 'The follicular phase is the first phase in the menstrual cycle.',
      tag1: 'cycle',
    ),
    createFunFactsStruct(
      phase: 'Follicular',
      fact:
          'Get the most out of the energy received during the follicular phase.',
      tag1: 'product',
    ),
    createFunFactsStruct(
      phase: 'Follicular',
      fact:
          'In the follicular phase, go for a long hike in nature, schedule a fun night out, try a new sport or plan a steamy date night. It\'s time to work up a sweat!',
      tag1: 'product',
    ),
    createFunFactsStruct(
      phase: 'Follicular',
      fact:
          'Follicular phase can overlap with the period, sometimes causing the secretion of blood and menstrual flow.',
      tag1: 'cycle',
    ),
    createFunFactsStruct(
      phase: 'Follicular',
      fact: 'Estrogen is known to help with strength and building muscle mass.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Follicular',
      fact:
          'Insulin sensitivity varies throughout the menstrual cycle, being the highest before ovulation and the lowest in the days preceding the menstrual period.',
      tag1: 'cycle',
    ),
    createFunFactsStruct(
      phase: 'Follicular',
      fact:
          'Part of the follicular phase overlaps with the proliferative phase, where the increased estrogen thickens uterus lining to allow for the egg to be implanted.',
      tag1: 'cycle',
    ),
    createFunFactsStruct(
      phase: 'Ovulation',
      fact: 'Estrogen rises during ovulation.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Ovulation',
      fact:
          'Ovulation occurs around day 14 of the typical  28-day menstrual cycle!',
      tag1: 'cycle',
    ),
    createFunFactsStruct(
      phase: 'Ovulation',
      fact:
          '6% to 12% of women may have PCOS, the most common cause of female infertility.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Ovulation',
      fact:
          'Women release 300-400 of their eggs through ovulation in their life.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Ovulation',
      fact:
          'Your temperature generally rises during ovulation! This can be checked with your basal temperature.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Ovulation',
      fact: 'The ovary is approximately the size and shape of almonds.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Ovulation',
      fact:
          'A mature egg is made available for fertilization during ovulation.',
      tag1: 'cycle',
    ),
    createFunFactsStruct(
      phase: 'Ovulation',
      fact: 'An egg lives 12-24 hours after leaving the ovary.',
      tag1: 'cycle',
    ),
    createFunFactsStruct(
      phase: 'Ovulation',
      fact: 'Environmental factors like stress can affect ovulation.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Ovulation',
      fact: 'The body is the most fertile the days before ovulation begins.',
      tag1: 'cycle',
    ),
    createFunFactsStruct(
      phase: 'Ovulation',
      fact:
          'Ovulation test strips can be purchased to test when it is approaching!',
      tag1: 'product',
    ),
    createFunFactsStruct(
      phase: 'Ovulation',
      fact: 'Libido often rises during ovulation.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Ovulation',
      fact: 'Eggs are not created monthly; they are all present at birth.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Ovulation',
      fact: 'Cancer treatments can cause infertility as it can kill eggs.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Ovulation',
      fact: 'Menstruation and ovulation do not always occur together.',
      tag1: 'cycle',
    ),
    createFunFactsStruct(
      phase: 'Ovulation',
      fact:
          'People who wish to preserve fertility during treatment for conditions like cancer can freeze their eggs.',
      tag1: 'product',
    ),
    createFunFactsStruct(
      phase: 'Ovulation',
      fact: 'Zinc is a possible mineral necessary for egg development.',
      tag1: 'product',
    ),
    createFunFactsStruct(
      phase: 'Ovulation',
      fact:
          'Smoking and second-hand smoke can negatively affect your fertility.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Ovulation',
      fact: 'Women are born with 1-2 million eggs.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Ovulation',
      fact:
          'The lining of the uterus is maintained by the hormone progesterone.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Ovulation',
      fact:
          'It\'s interesting that women with PCOS have a higher risk of type 2 diabetes.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Ovulation',
      fact: 'The ovary is made up of germ cells and somatic cells. ',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Ovulation',
      fact: 'An egg is also called an ovum, oocyte, or female gamete.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Ovulation',
      fact:
          'Lower abdominal pain during ovulation is called mittelschmerz pain.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Ovulation',
      fact: 'Ovulation lasts approximately 24-48 hours.',
      tag1: 'cycle',
    ),
    createFunFactsStruct(
      phase: 'Luteal',
      fact:
          'The typical length for the luteal phase is about 12-14 days, but ranges from 11-17 days.',
      tag1: 'cycle',
    ),
    createFunFactsStruct(
      phase: 'Luteal',
      fact:
          'The luteal phase is the period between ovulation and the next menstruation (period).',
      tag1: 'cycle',
    ),
    createFunFactsStruct(
      phase: 'Luteal',
      fact:
          'Progesterone produced by the corpus luteum (released egg) after ovulation causes a woman\'s basal body temperature to rise slightly by around 0.3-0.6 degrees Celsius (0.5-1 degrees Fahrenheit).',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Luteal',
      fact:
          'As levels of the hormone progesterone decrease, symptoms of PMS including irritability, anxiety, and fatigue rise. ',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Luteal',
      fact: 'During most of the luteal phase, estrogen levels remain high.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Luteal',
      fact:
          'If the follicle from the ovary is not fertilized, it is turned into a structure called corpus luteum which does not contain an egg.',
      tag1: 'cycle',
    ),
    createFunFactsStruct(
      phase: 'Luteal',
      fact:
          'The luteal phase helps prepare for pregnancy by thickening the lining of the uterus, resulting from the hormone progesterone.',
      tag1: 'cycle',
    ),
    createFunFactsStruct(
      phase: 'Luteal',
      fact:
          'During the luteal phase, cervical mucus will be thick and pasty in comparison to the thin and slippery mucus from ovulation.',
      tag1: 'cycle',
    ),
    createFunFactsStruct(
      phase: 'Luteal',
      fact:
          'When a luteal phase is 9 days or less, it is considered to be a short luteal phase. Up to 5% of individuals report short luteal phases during their reproductive years.',
      tag1: 'cycle',
    ),
    createFunFactsStruct(
      phase: 'Luteal',
      fact:
          'A long luteal phase is when the luteal phase lasts over 17 days and has been linked to polycystic ovarian syndrome (PCOS).',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Luteal',
      fact:
          'Progesterone released during the luteal phase is necessary for strong bone health, healthy sleep cycles, and metabolism.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Luteal',
      fact:
          'If the luteal phase of your menstrual cycle lasts less than 10 days or your ovaries don\'t make a proper amount of progesterone, you might have a luteal phase defect.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Luteal',
      fact:
          'Women in the luteal phase are significantly less controlled about their money spending and more impulsive than women earlier in their cycle.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Luteal',
      fact:
          'Energy intake appears to be lower in the follicular phase compared with the luteal phase, with a particular decrease in the days leading up to and including ovulation.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Luteal',
      fact:
          'Luteal phase deficiency (LPD) is a clinical diagnosis associated with an abnormal luteal phase length of less than 10 days.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Luteal',
      fact:
          'Follicular phase-based strength training is comparatively more effective than luteal phase-based strength training in untrained and moderately trained women.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Luteal',
      fact:
          'Women have higher energy expenditure in the luteal phase and compensate by eating more, particularly protein.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Luteal',
      fact:
          'Women show heightened self-inhibition responses during the luteal phase.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Luteal',
      fact: 'Women are more prosocial in the mid-luteal phase.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Luteal',
      fact:
          'The mid-luteal phase can be the peak of anaerobic performance in females.',
      tag1: 'product',
    ),
    createFunFactsStruct(
      phase: 'Luteal',
      fact:
          'The luteal phase is named after corpus luteum, a Latin word meaning “yellow body,” involved in the cycle.',
      tag1: 'cycle',
    ),
    createFunFactsStruct(
      phase: 'Luteal',
      fact: 'The luteal phase is also known as the secretory phase.',
      tag1: 'cycle',
    ),
    createFunFactsStruct(
      phase: 'Luteal',
      fact: 'The luteal phase prepares for a possible pregnancy.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Luteal',
      fact:
          'The uterine lining created during the luteal phase is shed during the period.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Luteal',
      fact:
          'Due to estrogen levels dropping, the luteal phase is when women feel the most tired.',
      tag1: 'body',
    ),
    createFunFactsStruct(
      phase: 'Luteal',
      fact:
          'The luteal phase can also be divided into two stages: metestrus and diestrus (sexual nonreceptivity.',
      tag1: 'body',
    ),
  ];
}

List<ToDoStruct> toDo(String currentPhase) {
  if (currentPhase == 'MENSTRUATION') {
    return [
      createToDoStruct(
          activity: 'Self Care',
          points: 3,
          phase: "MENSTRUATION",
          activityDescription:
              'It\'s time to relax! Treat yourself to the spa, take time for yourself, or pause and reflect! Have a self care day!'),
      createToDoStruct(
          activity: 'Read or journal',
          points: 1,
          phase: "MENSTRUATION",
          activityDescription:
              'Delve into a good book. Take time to journal your thoughts and reflect on your day.'),
      createToDoStruct(
          activity: 'Reschedule big events',
          points: 5,
          phase: "MENSTRUATION",
          activityDescription:
              'It\'s good to tone it down during this phase. Got a big meeting? A large party? Take a break and look through your calendar to reschedule these if possible.'),
      createToDoStruct(
          activity: 'Yoga or stretching',
          points: 1,
          phase: "MENSTRUATION",
          activityDescription:
              'Try focusing on your body. Studies show that yoga or stretching eases the mind and allows for increased efficiency during work. So get up and stretch!'),
      createToDoStruct(
          activity: 'Walk',
          points: 1,
          phase: "MENSTRUATION",
          activityDescription:
              'Take a walk down the street or in your neighborhood. Take in the scenery and appreciate nature. Taking a break to connect with Mother Nature helps refocus the mind and increases productivity.'),
      createToDoStruct(
          activity: '8+ hours of sleep',
          points: 3,
          phase: "MENSTRUATION",
          activityDescription:
              'Sleep is very important during this phase. Overworking your brain leads to slower actions the next day. However, lots of rest allows for higher efficiency and retainment of important information.'),
      createToDoStruct(
          activity: 'Drink 64-80oz of water',
          points: 3,
          phase: "MENSTRUATION",
          activityDescription:
              'Keeping hydrated is important during this phase. Water helps flush out your system and may decrease cramps during your period. Lack of dehydration will help ease out menstrual headaches and allow you to work more diligently and effectively.'),
      createToDoStruct(
          activity: 'Small social groups',
          points: 3,
          phase: "MENSTRUATION",
          activityDescription:
              'Stay reserved, only hang with close friends. Research shows that social levels are lower in this phase. Avoid large crowds and events. Such events may lead to stress and affect work capability.'),
    ];
  } else if (currentPhase == 'FOLLICULAR') {
    return [
      createToDoStruct(
          activity: 'Spend time outdoors',
          points: 3,
          phase: "FOLLICULAR",
          activityDescription:
              'Go outside to run, hike, bike, or garden. You have more energy to burn off during this phase and it\'s good to do this outdoors as it serves as a way to refresh after a long day of work.'),
      createToDoStruct(
          activity: 'Intense workout',
          points: 3,
          phase: "FOLLICULAR",
          activityDescription:
              'Time to get active! Put all that energy you have to good use by doing a HIIT workout for at least 20 minutes. Explore strength training and cardio workouts. These will help you stay healthier and lead to less potentially productive days spent sick and idle.'),
      createToDoStruct(
          activity: 'Eat healthy',
          points: 3,
          phase: "FOLLICULAR",
          activityDescription:
              'Focus on your health. While it may seem junk food makes you happy, a balanced diet of greens, grains, and carbs will lead to long-term happiness and health. You will find yourself become a more productive individual when your body gets the nutrients necessary for it to function.'),
      createToDoStruct(
          activity: 'Outdoor adventures',
          points: 5,
          phase: "FOLLICULAR",
          activityDescription:
              'Go on some outdoor adventures with friends and family. Spending your energy and being social helps stimulate the mind and body.'),
      createToDoStruct(
          activity: '6+ hours of sleep',
          points: 2,
          phase: "FOLLICULAR",
          activityDescription:
              'According to research, it is most difficult to fall asleep during this phase because your body is more active. However, at least 6 hours of sleep is still important for proper functioning the next day.'),
    ];
  } else if (currentPhase == 'OVULATION') {
    return [
      createToDoStruct(
          activity: 'Fun sports',
          points: 3,
          phase: "OVULATION",
          activityDescription:
              'Do some fun sports such as dancing to burn off some energy. This will help stabilize your energy levels and it will support the undulating hormonal levels common during this phase.'),
      createToDoStruct(
          activity: 'Intense workout',
          points: 3,
          phase: "OVULATION",
          activityDescription:
              'Do some intense cardio or weightlifting for at least 20 minutes. These will help you stay healthier and lead to less potentially productive days spent sick and idle.'),
      createToDoStruct(
          activity: '8+ hours of sleep',
          points: 2,
          phase: "OVULATION",
          activityDescription:
              'Sleep is very important during this phase. Overworking your brain leads to slower actions the next day. However, lots of rest allows for higher efficiency and retainment of important information.'),
      createToDoStruct(
          activity: 'Meditation',
          points: 1,
          phase: "OVULATION",
          activityDescription:
              'Studies show that mood swings are common during this phase and affect productivity negatively. Practicing mindfulness and meditation helps stabilize this and leads to a more focused mind.'),
      createToDoStruct(
          activity: 'Attend large events',
          points: 3,
          phase: "OVULATION",
          activityDescription:
              'This is the time to enjoy big parties and gatherings with all of your friends. Take your mind off of your workload and have fun. Believe it or not, this will actually help you become more work-oriented.'),
      createToDoStruct(
          activity: 'Socialize',
          points: 2,
          phase: "OVULATION",
          activityDescription:
              'Social abilities are at their peak right now. Strike up a conversation with an old friend, plan more important meetings in this time, or go make new friends!'),
    ];

// DO THE REST OF THESE.
  } else if (currentPhase == 'LUTEAL') {
    return [
      createToDoStruct(
          activity: 'Read a book',
          points: 2,
          phase: "LUTEAL",
          activityDescription:
              'Calm your mind during a break by reading your choice of genre: adventure, fantasy, nonfiction, etc. This will help you clear your mind and ready to tackle the next task.'),
      createToDoStruct(
          activity: 'Try deep breathing exercises',
          points: 1,
          phase: "LUTEAL",
          activityDescription:
              'Time to take a DEEEEP breath. Breathe in and out while holding a comfortable position. You are the most tired and tender during this phase. Be sure to take some time and recollect yourself!'),
      createToDoStruct(
          activity: 'Do yoga/pilates',
          points: 2,
          phase: "LUTEAL",
          activityDescription:
              'Try focusing on your body. Studies show that yoga or stretching eases the mind and allows for increased efficiency during work. So get up and stretch!'),
      createToDoStruct(
          activity: 'Get 8+ hours of sleep',
          points: 3,
          phase: "LUTEAL",
          activityDescription:
              'Sleep is very important during this phase. Overworking your brain leads to slower actions the next day. However, lots of rest allows for higher efficiency and retainment of important information.'),
      createToDoStruct(
          activity: 'Take a warm bath',
          points: 3,
          phase: "LUTEAL",
          activityDescription:
              'Now is the best time for you to take a dip in warm water to ease any tension and stress. Best way to prevent cramps too!'),
      createToDoStruct(
          activity: 'Stick to small gatherings with close friends only',
          points: 3,
          phase: "LUTEAL",
          activityDescription:
              'You may be feeling tired or annoyed, so it may be best to stick with who you\'re most comfortable with! Although rest is optimal, socializing is also important, so if you do get together, stick with just a few!'),
    ];
  } else {
    return [];
  }
}

int avgPoints(List<int>? listOfPoints) {
  if (listOfPoints?.length == 0) {
    return 0;
  }

  int sum = 0;
  for (int i = 0; i < listOfPoints!.length; i++) {
    sum += listOfPoints[i];
  }
  return ((sum / listOfPoints.length)).round();
}

int daysSinceMenstruation(DateTime dateOfCycle) {
  DateTime now = DateTime.now();

  // Days since last cycle
  int daysPassed = now.difference(dateOfCycle).inDays;
  return daysPassed;
}
