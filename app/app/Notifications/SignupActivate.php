<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class SignupActivate extends Notification
{
    use Queueable;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        $url = url('auth/signup/activate/'.$notifiable->activation_token);
       
       /* return (new MailMessage)
            ->subject('Confirma tu cuenta')
            ->line('Gracias por suscribirte! Antes de continuar, debes configurar tu cuenta.')
            ->action('Confirmar tu cuenta', url($url))
            ->line('Muchas gracias por utilizar nuestra aplicación!');*/

            return (new MailMessage)
            ->subject('Activación de Registro')
            ->view(
                'mails.registro', ['url'=>$url]
            );

    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
