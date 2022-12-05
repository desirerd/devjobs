<?php

namespace App\Http\Livewire;

use App\Models\Vacante;
use App\Notifications\NuevoCandidato;
use Livewire\Component;
use Livewire\WithFileUploads;

class PostularVacante extends Component
{
    // Habilitamos la carga de ficheros

    use WithFileUploads;
    public $cv;
    public $vacante;

    // Reglas de validación 

    protected $rules = [
        'cv' => 'required|mimes:pdf'
    ];


    public function mount(Vacante $vacante){
        $this->vacante = $vacante;
    }

    public function postularme(){
       
        // Almacenar CV en el disco duro

        $datos = $this->validate();

        // Almacenar CV
            // metodo de livewire llamado store para guardar, está en storage>app>public
          
            $cv =  $this->cv->store('public/cv');
          
            // Quitamos public/vacantes, para quedarnos solo con el nombre del archivo y guardarlo en B.D
          
            $datos['cv'] = str_replace('public/cv/','', $cv);
        
        // Crear el candidato o vacante

         $this->vacante->candidatos()->create([

            'user_id' => auth()->user()->id,
            'cv' => $datos['cv']
         ]);

        // Crear notificacion y enviar el email
        // Instanciamos un nuevo candidato y notificamos al reclutador que ha recibido una nueva persona interesada.
        
        $this->vacante->reclutador->notify(New NuevoCandidato($this->vacante->id, $this->vacante->titulo, auth()->user()->id));

        // Mostrar al usuario un mensaje de que todo fue OK

        session()->flash('mensaje', 'Se envió correctamente tu información, mucha suerte');

        return redirect()->back();
    }

    public function render()
    {
        return view('livewire.postular-vacante');
    }
}
