package com.en.devtools.dev_tools

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.widget.FrameLayout
import io.flutter.plugin.platform.PlatformView


class NativeFragmentView internal constructor(context: Context?) : PlatformView {
    private val container = FrameLayout(context!!)

    init {
        LayoutInflater.from(context).inflate(R.layout.fragment_advertise, container, true)
    }

    override fun getView(): View {
        return container
    }

    override fun dispose() {}
}
