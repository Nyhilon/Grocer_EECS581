package com.example.grocerapplication

import android.content.Context
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentManager
import androidx.fragment.app.FragmentPagerAdapter

internal class MyAdapter(var context: Context, fm: FragmentManager, var totalTabs: Int): FragmentPagerAdapter(fm) {

    override fun getItem(position: Int): Fragment {
        return when(position) {
            0 -> { PantryItemsFragment() }
            1 -> { Home() }
            2 -> { Recipes() }
            else -> getItem(position)
        }
    }

    override fun getCount(): Int {
        return totalTabs
    }
}