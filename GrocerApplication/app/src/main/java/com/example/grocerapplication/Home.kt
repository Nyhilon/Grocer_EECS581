package com.example.grocerapplication

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.*
import com.google.android.material.floatingactionbutton.ExtendedFloatingActionButton
import android.widget.ArrayAdapter
import android.widget.ListView
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.Observer
import com.google.android.material.snackbar.Snackbar
import org.w3c.dom.Text

// TODO: Rename parameter arguments, choose names that match
// the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
private const val ARG_PARAM1 = "param1"
private const val ARG_PARAM2 = "param2"
private lateinit var listView: ListView
val items = ArrayList<CharSequence>()

/**
 * A simple [Fragment] subclass.
 * Use the [Home.newInstance] factory method to
 * create an instance of this fragment.
 */
class Home : Fragment() {
    lateinit var addFAB: ExtendedFloatingActionButton

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_home, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        addFAB = view.findViewById(R.id.addList)
        listView = view.findViewById(R.id.home)
        val adapter = ArrayAdapter(requireActivity(), android.R.layout.simple_list_item_1, items)

        addFAB.setOnClickListener{
            val popupMenu:PopupMenu = PopupMenu(activity, addFAB)
            popupMenu.menuInflater.inflate(R.menu.popup_menu, popupMenu.menu)
            popupMenu.setOnMenuItemClickListener ( PopupMenu.OnMenuItemClickListener{ item ->
                when(item.itemId){
                    R.id.rice ->
                        items.add(item.title)
                    R.id.apple ->
                        items.add(item.title)
                }
                listView.adapter = adapter
                true
            })
            popupMenu.show()
            }
        }
    }


