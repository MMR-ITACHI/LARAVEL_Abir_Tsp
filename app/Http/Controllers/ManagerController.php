<?php

namespace App\Http\Controllers;

use App\Models\Branch;
use App\Models\Manager;
use Illuminate\Http\Request;

class ManagerController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $managers = Manager::OrderBy('id','desc')->get();

        return view('backend.manager.index', compact('managers'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $branches =Branch::all() ;
        return view('backend.manager.create', compact('branches'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate(
            [
            'name'=>'required | max:100 | min:5',
            'email'=>'required | email | max:50', 
            'number'=>'required | min:11',
            'password'=>'required | min:8 | confirmed',
            'branch_name'=>'required',
            'status'=>'required',
            'photo'=>' image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            ]
            
            
            );
            
            if ($image = $request->file('photo')) {
                $destinationPath = 'images/';
                $postImage = date('YmdHis') . "." . $image->getClientOriginalExtension();
                $image->move($destinationPath, $postImage);
                $photo = $destinationPath.$postImage;
            }
            
            else{
            $photo = 'images/nophoto.jpg';
            }
                    
                


        $manager = new Manager();

        $manager->name = $request->name;
        $manager->email = $request->email;
        $manager->number = $request->number;
        $manager->password = bcrypt($request->password);
        $manager->branch_id = $request->branch_name;
        $manager->status = $request->status;
        $manager->photo = $photo;
        

       $manager->save();
       return redirect()->route('manager.index')->with('msg','Successfully Added');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Manager $manager)
    {
        $branches =Branch::all() ;
        return view('backend.manager.edit', compact('manager','branches'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Manager $manager, Request $request)
    {
        $request->validate(
            [
            'name'=>'required | max:100 | min:5',
            'email'=>'required | email | max:50', 
            'number'=>'required | min:11',
            'branch_name'=>'required',
            'status'=>'required',
            'photo'=>' image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            ]
            
            
            );
            
            if ($image = $request->file('photo')) {
                $destinationPath = 'images/';
                $postImage = date('YmdHis') . "." . $image->getClientOriginalExtension();
                $image->move($destinationPath, $postImage);
                $photo = $destinationPath.$postImage;
            }
            
            else{
            $photo = 'images/nophoto.jpg';
            }
                    
                


        $manager->name = $request->name;
        $manager->email = $request->email;
        $manager->number = $request->number;
        $manager->branch_id = $request->branch_name;
        $manager->status = $request->status;
        $manager->photo = $photo;
        

       $manager->save();
       return redirect()->route('manager.index')->with('msg','Successfully Added');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
