package ar.edu.unq.programacionui.gatoencerradomobile.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import java.util.List;

import ar.edu.unq.programacionui.gatoencerradomobile.R;
import ar.edu.unq.programacionui.gatoencerradomobile.laberintos.domain.Laberinto;

/**
 * Created by rs21 on 14/06/16.
 */
public class LaberintoAdapter extends ArrayAdapter<Laberinto>{


    public LaberintoAdapter(Context context, int resource, List<Laberinto> objects) {
        super(context, resource, objects);
    }

    @Override
    public long getItemId(int position) {
        return getItem(position).getIdLaberinto();
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        LayoutInflater inflater = (LayoutInflater) getContext()
                .getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        View rowView = inflater.inflate(R.layout.pelicula_row, parent, false);
        final Laberinto laberinto = getItem(position);

        /*
        TextView tvPelicula = (TextView) rowView.findViewById(R.id.lblPelicula);
        tvPelicula.setText(laberinto.toString());

        TextView tvActores = (TextView) rowView.findViewById(R.id.lblActores);
        tvActores.setText(laberinto.getActores());
        */
        return rowView;
    }
}
