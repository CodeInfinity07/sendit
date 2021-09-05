
<?php
 
/**
 * @author Ravi Tamada
 * @link URL Tutorial link
 */
class Push {
 
    // push message title
    private $title;
    private $message;
    private $image;

    private $is_background;

 
    function __construct() {
         
    }
 
    public function setTitle($title) {
        $this->title = $title;
    }
 
 
 

    public function setMessage($message) {
        $this->message = $message;
    }
 
    public function setImage($imageUrl) {
        $this->image = $imageUrl;
    }
 
 
 
    public function setIsBackground($is_background) {
        $this->is_background = $is_background;
    }
 
    public function getPush() {
         date_default_timezone_set('Africa/Johannesburg');
        $hour=date("H:i");
        $date=date("Y-m-d");

        $res = array();
        $res['data']['title'] = $this->title;
        $res['data']['is_background'] = $this->is_background;
        $res['data']['message'] = $this->message;
        $res['data']['image'] = $this->image;
        $res['data']['timestamp'] = $date.$hour;
        return $res;
    }
 
}