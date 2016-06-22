package ar.edu.unq.programacionui.gatoencerradomobile.laberintos.services;

import java.util.List;

import ar.edu.unq.programacionui.gatoencerradomobile.laberintos.domain.Laberinto;
import retrofit.Call;
import retrofit.http.GET;
import retrofit.http.Path;

/**
 * Created by rs21 on 14/06/16.
 */
public interface LaberintosService {

    @GET("laberintos/{idUsuario}")
    public Call<List<Laberinto>> getLaberintos(@Path("idUsuario") String id);
}
