/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author Alumno_2DAW
 */
public class Libro {
    private String titulo;
    private String isbn;
    private String descripcion;
    private String editorial;
    private String autor;

    public Libro(){
        
    }

    public Libro(String titulo, String isbn, String descripcion, String editorial, String autor) {
        this.titulo = titulo;
        this.isbn = isbn;
        this.descripcion = descripcion;
        this.editorial = editorial;
        this.autor = autor;
      
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getEditorial() {
        return editorial;
    }

    public void setEditorial(String editorial) {
        this.editorial = editorial;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

  
            
}
