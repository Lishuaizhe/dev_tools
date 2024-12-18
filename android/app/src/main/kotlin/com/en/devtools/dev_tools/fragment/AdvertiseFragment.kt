package com.en.devtools.dev_tools.fragment

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment


class AdvertiseFragment : Fragment() ,View.OnClickListener{
    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(com.en.devtools.dev_tools.R.layout.fragment_advertise, container, false)
    }

    override fun onClick(v: View?) {
    }
}