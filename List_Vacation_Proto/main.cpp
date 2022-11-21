#include "node.h"
#include "MyVector_2923175.h"
#include <string>
#include <iostream>


 int main()
 {
   node meatballs[13];
   meatballs[0].setIngt("Italian Bread");
   meatballs[1].setIngt("Ground Beef");
   meatballs[2].setIngt("Ground Pork");
   meatballs[3].setIngt("Milk");
   meatballs[4].setIngt("Eggs");
   meatballs[5].setIngt("Parmesian Cheese");
   meatballs[5].setIngt("Olive Oil");
   meatballs[6].setIngt("White Onions");
   meatballs[7].setIngt("Garlic");
   meatballs[8].setIngt("Basil");
   meatballs[9].setIngt("Parsley");
   meatballs[10].setIngt("Oregeno");
   meatballs[11].setIngt("Spaghetti Sauce");
   meatballs[12].setIngt("Spaghetti Noodles");

   node ground_beef_tacos[5];
   ground_beef_tacos[0].setIngt("Ground Beef");
   ground_beef_tacos[1].setIngt("Taco Seasoning");
   ground_beef_tacos[2].setIngt("White Onions");
   ground_beef_tacos[3].setIngt("Roma Tomatoes");
   ground_beef_tacos[4].setIngt("Tortillas");

   /*
   1. Creating list of recipes
   2. Adding meatballs to list of recipes
   3. Adding ground beef tacos to list of recipes
   */
   MyVector<node[]> recipes;
   recipes.push_back(meatballs);
   recipes.push_back(ground_beef_tacos);

   //now I need to create the grocery list of these recipes
   //grocery list is just a list of ingredients, taken from recipes

   MyVector<std::string> grocery_list;
   MyVector<node[]>::iterator itr1= recipes.begin();
   for(int i= 0; i < 13; i++)
   {
     grocery_list.push_back((*itr1)[i].getName());
   }
   MyVector<node[]>::iterator itr2= recipes.end();

   for(int j= 0; j < 5; j++)
   {
     bool already_added= 0;
     for(int k= 0; k < 13; k++)
     {
       if((*itr1)[k].getName()== (*itr2)[j].getName())
       {
         already_added= 1;
       }
     }

     if(!already_added)
     {
       grocery_list.push_back((*itr2)[j].getName());
     }
   }

   //now I have a vector full of values
   //now I should list the ingredients
   MyVector<std::string>::iterator grocery_itr= grocery_list.begin();
   std::cout<<"Grocery List: \n";
   for(int i= 0; i < grocery_list.size(); i++)
   {
     std::cout<<i+1<<". "<<*grocery_itr<<"\n";
     ++grocery_itr;
   }

   //now that I've listed the ingredients, I'm going to remove each element
   //changing the onList variable of each corresponding node with checkOff

   while(!grocery_list.empty())
   {
     //string to compare with each list

     for(int i= 0; i < 13; i++)
     {
       if(grocery_list.back().getName()== (*itr1)[i])
       {
         (*itr1)[i].checkOff();
       }
     }

     for(int j= 0; i < 5; j++)
     {
       if(grocery_list.back().getName()== (*itr2)[j])
       {
         (*itr2)[j].checkOff();
       }
     }
     //at this point I've checked off the ingredient from each recipe
     //I now need to check has() on each recipe to see if it can be printed
     bool checkpoint= 0;

     for(int i= 0; i < 13; i++)
     {
       if((*itr1)[i].has())
       {
         checkpoint= 1;
         break;
       }
     }

     if(!checkpoint)
     {
       std::cout<<"Meatball Recipe Purchased!\n Ingredients:\n";
       for(int i= 0; i < 13; i++)
       {
         std::cout<<i<<". "<<(*itr1)[i].getName()<<"\n";
       }
     }

     checkpoint= 0;

     for(int j= 0; j < 5; j++)
     {
       if((*itr2)[j].has())
       {
         checkpoint= 1;
         break;
       }
     }

     if(!checkpoint)
     {
       std::cout<<"Ground Beef Tacos Recipe Purchased!\n Ingredients:\n";
       for(int j= 0; j < 5; j++)
       {
         std::cout<<j<<". "<<(*itr2)[j].getName()<<"\n";
       }
     }
     grocery_list.pop_back();
   }


   return 0;
 }
