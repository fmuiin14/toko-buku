<?php

use Illuminate\Database\Seeder;

class AdministratorSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $administrator = new \App\User;
        $administrator->username = "fmuiin14";
        $administrator->name = "Fathul Muiin";
        $administrator->email = "fmuiin14@gmail.com";
        $administrator->roles = json_encode(["ADMIN"]);
        $administrator->password = \Hash::make("3ybtt9je");
        $administrator->avatar = "saat-ini-tidak-ada-file.png";
        $administrator->address = "Depok, Jawa Barat, Indonesia";
        $administrator->phone = "089679590971";

        $administrator->save();

        $this->command->info("User admin berhasil di insert");
    }
}
