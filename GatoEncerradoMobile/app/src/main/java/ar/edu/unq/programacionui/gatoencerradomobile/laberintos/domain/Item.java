package ar.edu.unq.programacionui.gatoencerradomobile.laberintos.domain;

import java.io.Serializable;

/**
 * Created by rs21 on 14/06/16.
 */
public class Item implements Serializable{

    String nombreItem;

    public Item(String nombre){

        this.nombreItem = nombre;
    }

    public String getNombreItem() {
        return nombreItem;
    }

    public void setNombreItem(String nombreItem) {
        this.nombreItem = nombreItem;
    }
}
