package ar.edu.unq.programacionui.gatoencerradomobile.laberintosApp;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcelable;
import android.support.design.widget.CollapsingToolbarLayout;
import android.support.design.widget.FloatingActionButton;
import android.support.v4.app.Fragment;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.ArrayList;

import ar.edu.unq.programacionui.gatoencerradomobile.R;
import ar.edu.unq.programacionui.gatoencerradomobile.laberintos.domain.Laberinto;

public class LaberintoDetailFragment extends Fragment {

    public static final String ARG_ITEM_ID = "item_id";
    private Laberinto laberinto;

    public LaberintoDetailFragment() {
        // Required empty public constructor
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        if (getArguments().containsKey(ARG_ITEM_ID)) {
            laberinto = (Laberinto) getArguments().get(ARG_ITEM_ID);

            Activity activity = this.getActivity();
            Toolbar t = (Toolbar) activity.findViewById(R.id.list_toolbar);
            if (t != null) {
                t.setTitle(laberinto.getNombreLaberinto());
            } else {
                activity.setTitle(laberinto.getNombreLaberinto());
            }
        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_laberinto_detail, container, false);

        if (laberinto != null) {
            ((TextView) rootView.findViewById(R.id.descripcion_laberinto)).setText(laberinto.getDescripcionLaberinto());
            ImageView imgLaberinto = ((ImageView) rootView.findViewById(R.id.imagen_laberinto));
            imgLaberinto.setImageDrawable(getResources().getDrawable(laberinto.getPathImagenLaberinto()));
        }

        return rootView;
    }
}
