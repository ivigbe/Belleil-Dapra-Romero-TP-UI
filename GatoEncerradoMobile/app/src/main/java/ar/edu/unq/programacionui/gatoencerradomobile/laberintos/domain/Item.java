package ar.edu.unq.programacionui.gatoencerradomobile.laberintos.domain;

import java.io.Serializable;

/**
 * Created by rs21 on 14/06/16.
 */
public class Item implements Serializable{

    String nombreItem;
    Integer idItem;
    int pathImgItem;

    public Item(String nombre, Integer id){

        this.nombreItem = nombre;
        this.idItem = id;
    }

    public String getNombreItem() {
        return nombreItem;
    }

    public void setNombreItem(String nombreItem) {
        this.nombreItem = nombreItem;
    }

    public Integer getIdItem() {
        return idItem;
    }

    public void setIdItem(Integer idItem) {
        this.idItem = idItem;
    }

    public int getPathImgItem() {
        return pathImgItem;
    }

    public void setPathImgItem(int pathImgItem) {
        this.pathImgItem = pathImgItem;
    }
}
