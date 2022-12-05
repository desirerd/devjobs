
@php
    
    $classes = "text-sm text-gray-600 hover:text-gray-900 
    rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2
     focus:ring-indigo-500"
@endphp

<!-- Le pasamos como atributo el href desde login.blade , Va a unir los atributos que recibe, pero el de la clase
del enlace, lo obtiene de la variable $classes -->

    <a {{ $attributes->merge(['class' => $classes]) }}>
        {{ $slot }}
    </a>
