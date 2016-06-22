package ar.edu.unq.programacionui.gatoencerradomobile.adapters;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.media.Image;
import android.support.annotation.DrawableRes;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.List;

import ar.edu.unq.programacionui.gatoencerradomobile.R;
import ar.edu.unq.programacionui.gatoencerradomobile.laberintos.domain.Laberinto;

/**
 * Created by rs21 on 14/06/16.
 */
public class LaberintoAdapter extends ArrayAdapter<Laberinto>{


    public LaberintoAdapter(Context context, List<Laberinto> objects) {
        super(context, R.layout.laberinto_row, objects);
    }

    @Override
    public long getItemId(int position) {
        return getItem(position).getIdLaberinto();
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        LayoutInflater inflater = (LayoutInflater) getContext()
                .getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        View rowView = inflater.inflate(R.layout.laberinto_row, parent, false);
        final Laberinto laberinto = getItem(position);

        TextView tvLaberinto = (TextView) rowView.findViewById(R.id.text_laberinto_row);
        tvLaberinto.setText(laberinto.toString());

        ImageView imgLaberinto = (ImageView) rowView.findViewById(R.id.imagen_laberinto);
        imgLaberinto.setImageResource(laberinto.getPathImagenLaberinto());
        return rowView;
    }
}
