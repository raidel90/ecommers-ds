<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use URL;
class EntregaMail extends Notification
{
    use Queueable;
    
    protected $order,$user,$total,	$productos;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($user,$order,$productos,$total)
    {
        $this->user = $user;
        $this->order = $order;
        $this->productos = $productos;
        $this->total = $total;
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
        return (new MailMessage)
        ->view(
            'mails.mail', [ 
				'user'=>$this->user,
				'fecha'=>$this->order['date'],
				'metodo_pago'=>$this->order['lapPaymentMethod'],
				'referencia'=>$this->order['reference'],
				'total'=>$this->total,
				'url'=> URL::to('/') . '/order/' . $this->order->id, 
				'productos'=>$this->productos
				]
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
