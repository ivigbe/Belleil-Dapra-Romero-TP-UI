package ar.edu.unq.programacionui.gatoencerradomobile.laberintos.domain;

import java.io.Serializable;
import java.util.ArrayList;

/**
 * Created by rs21 on 14/06/16.
 */
public class Laberinto implements Serializable{

    String nombreLaberinto;
    Integer idLaberinto;
    int pathImagenLaberinto;
    String descripcionLaberinto;
    ArrayList<Item> inventarioDelJugador = new ArrayList<Item>(15);

    public Laberinto(String nombre, Integer id, int path, String desc, ArrayList<Item> inventario){
        this.nombreLaberinto = nombre;
        this.idLaberinto = id;
        this.pathImagenLaberinto = path;
        this.descripcionLaberinto = desc;
        this.inventarioDelJugador = inventario;

    }

    public String getNombreLaberinto() {
        return nombreLaberinto;
    }

    public void setNombreLaberinto(String nombreLaberinto) {
        this.nombreLaberinto = nombreLaberinto;
    }

    public Integer getIdLaberinto() {
        return idLaberinto;
    }

    public void setIdLaberinto(Integer idLaberinto) {
        this.idLaberinto = idLaberinto;
    }

    public int getPathImagenLaberinto() {
        return pathImagenLaberinto;
    }

    public void setPathImagenLaberinto(int pathImagenLaberinto) {
        this.pathImagenLaberinto = pathImagenLaberinto;
    }

    public String getDescripcionLaberinto() {
        return descripcionLaberinto;
    }

    public void setDescripcionLaberinto(String descripcionLaberinto) {
        this.descripcionLaberinto = descripcionLaberinto;
    }

    public ArrayList<Item> getInventarioDelJugador() {
        return inventarioDelJugador;
    }

    public void setInventarioDelJugador(ArrayList<Item> inventarioDelJugador) {
        this.inventarioDelJugador = inventarioDelJugador;
    }
}
