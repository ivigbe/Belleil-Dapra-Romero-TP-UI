package ar.edu.unq.programacionui.gatoencerradomobile.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

import ar.edu.unq.programacionui.gatoencerradomobile.R;
import ar.edu.unq.programacionui.gatoencerradomobile.laberintos.domain.Item;
import ar.edu.unq.programacionui.gatoencerradomobile.laberintos.domain.Laberinto;

/**
 * Created by rs21 on 25/06/16.
 */
public class InventarioAdapter extends ArrayAdapter<Item> {

    public InventarioAdapter(Context context, ArrayList<Item> objects) {
        super(context, R.layout.inventario_row, objects);
    }

    @Override
    public long getItemId(int position) {
        return getItem(position).getIdItem();
    }

    @Override
    public View getView(final int position, View convertView, ViewGroup parent) {
        LayoutInflater inflater = (LayoutInflater) getContext()
                .getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        View rowView = inflater.inflate(R.layout.inventario_row, parent, false);
        final Item item = getItem(position);

        TextView tvItem = (TextView) rowView.findViewById(R.id.nombre_item);
        tvItem.setText(item.getNombreItem());

        ImageView imgItem = (ImageView) rowView.findViewById(R.id.img_item);
        imgItem.setImageResource(item.getPathImgItem());

        Button tirar = (Button) rowView.findViewById(R.id.boton_tirar);

        tirar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                remove(item);
                notifyDataSetChanged();
            }
        });

        return rowView;
    }
}
