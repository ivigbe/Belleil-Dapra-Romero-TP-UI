package ar.edu.unq.programacionui.gatoencerradomobile.laberintos.services;

import java.util.ArrayList;
import java.util.List;

import ar.edu.unq.programacionui.gatoencerradomobile.laberintos.domain.Item;
import ar.edu.unq.programacionui.gatoencerradomobile.laberintos.domain.Laberinto;
import retrofit.Call;
import retrofit.http.GET;
import retrofit.http.Path;

public interface LaberintosService {

    @GET("laberintosMobile/{idUsuario}")
    public Call<List<Laberinto>> getLaberintosMobile(@Path("idUsuario") String id);

    @GET("inventario/{idUsuario}")
    public Call<ArrayList<Item>> getInventario(@Path("idUsuario") String id);
}
