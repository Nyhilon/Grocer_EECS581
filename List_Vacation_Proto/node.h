#ifndef __NODE_H__
#define __NODE_H__
#include <string>

class node
{
  private:
    std::string name;
    bool onList;
  public:
    node()
    {
      name= "null";
      onList= 1;
    }

    void setIngt(std::string ingredient)
    {
      name= ingredient;
    }

    std::string getName()
    {
      return name;
    }

    bool has()
    {
      if(onList== 1)
      {
        return true;
      }
      else
      {
        return false;
      }
    }

    void checkOff()
    {
      onList= 0;
    }


};

#endif
