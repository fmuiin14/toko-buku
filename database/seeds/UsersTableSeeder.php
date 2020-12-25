<?php

use Illuminate\Database\Seeder;
use Faker\Factory as Faker;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create();
        foreach(range(0,20) as $i) {
        DB::table('users')->insert([
            'username' => $faker->username,
            'name' => $faker->name,
            'email' => $faker->email,
            'roles' => json_encode(["ADMIN", "STAFF"]),
            'password' => \Hash::make('user1234'),
            'avatar' => 'saat-ini-tidak-ada.png',
            'address' => $faker->address,
            'phone' => $faker->phoneNumber
            ]);
        }
    }
}
