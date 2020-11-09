<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Beranda extends CI_Controller {

	public function __construct(){
		parent::__construct();
		if($this->session->logged!==true){
	      redirect('auth');
	    }
	}
	
	public function index()
	{
		$datacontent['title']='Halaman Beranda';//membuat variable baru bernama datacontent bentuk arraynya title untuk di kirim ke berandaView
		$data['content']=$this->load->view('berandaView',$datacontent,TRUE);//mendeskripsikan file berandaView sebagai contents
		$data['title']='Selamat Datang di Beranda';//membuat variable baru bernama data bentuk arraynya title untuk di kirim ke html
		$this->load->view('layouts/html',$data);//meload file html
	}
}
