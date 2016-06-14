package ar.edu.unq.programacionui.gatoencerradomobile.laberintosApp;

import android.app.Activity;
import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.support.design.widget.CollapsingToolbarLayout;
import android.support.v4.app.Fragment;
import android.support.v7.widget.Toolbar;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import ar.edu.unq.programacionui.gatoencerradomobile.R;
import ar.edu.unq.programacionui.gatoencerradomobile.laberintos.domain.Laberinto;

/**
 * A simple {@link Fragment} subclass.
 * Activities that contain this fragment must implement the
 * {@link LaberintoDetailFragment.OnFragmentInteractionListener} interface
 * to handle interaction events.
 * Use the {@link LaberintoDetailFragment#newInstance} factory method to
 * create an instance of this fragment.
 */
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
            Toolbar appBarLayout = (Toolbar) activity.findViewById(R.id.detail_toolbar);
            if (appBarLayout != null) {
                appBarLayout.setTitle(laberinto.getNombreLaberinto());
            } else {
                activity.setTitle(laberinto.getNombreLaberinto());
            }
        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View rootView = inflater.inflate(R.layout.fragment_laberinto_detail, container, false);

        // Show the dummy content as text in a TextView.
        if (laberinto != null) {
            ImageView imgLaberintoSeleccionado = ((ImageView) rootView.findViewById(R.id.imagen_laberinto));
            imgLaberintoSeleccionado.setImageDrawable(getResources().getDrawable(new LaberintoAdapter().getImgLaberinto(laberinto)));
            ((TextView) rootView.findViewById(R.id.descripcion_laberinto)).setText(laberinto.getDescripcionLaberinto());
        }

        return rootView;
    }
}
