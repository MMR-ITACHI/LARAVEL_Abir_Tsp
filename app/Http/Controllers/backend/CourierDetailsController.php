<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\Branch;
use App\Models\Courierdetail;
use App\Models\Unit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CourierDetailsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {

       

        $couriers = Courierdetail::all();
        return view('backend.courierdetails.courier_list_index',compact('couriers','branches'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $units = Unit::all();
        return view('backend.courierdetails.create',compact('units'));

    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $sender_agent_id = Auth::user()->id;
        $receiver_branch_id = Auth::user()->branch_id;
        $manager_id = Auth::user()->manager_id;
        $tracking = time().'acer';


        $cdetails =   new Courierdetail;

        $cdetails->sender_type = $request->sender_type;
        $cdetails->company_name = $request->company_name;
        $cdetails->sender_name = $request->sender_name;
        $cdetails->sender_email = $request->sender_email;
        $cdetails->sender_phone = $request->sender_phone_number;
        $cdetails->sender_address = $request->sender_address;
        $cdetails->receiver_name = $request->receiver_name;
        $cdetails->receiver_email = $request->receiver_email;
        $cdetails->receiver_phone = $request->receiver_phone_number;
        $cdetails->receiver_address = $request->receiver_address;

        $cdetails->receiver_branch_id = $receiver_branch_id;
        $cdetails->sender_agent_id = $sender_agent_id;
        $cdetails->manager_id = $manager_id;


        $cdetails->status = $request->status;
        $cdetails->tracking_id = $tracking;
        $cdetails->item_description = $request->item_description;
        $cdetails->unit_name = $request->unit_name;
        $cdetails->cost = $request->unit_price;
        $cdetails->quantity = $request->quantity;
        $cdetails->total_cost = $request->total;
        $cdetails->comment = $request->special_comment;
        $cdetails->grand_total = $request->subtotal;
        $cdetails->payment_type = $request->payment_type;
        $cdetails->payment_amount = $request->amt;

        $cdetails->save();

        return redirect()->route('courierdetails.create')->with('msg','Success');
    }

    /**
     * Display the specified resource.
     */
    public function show(Courierdetail $courierdetail)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Courierdetail $courierdetail)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Courierdetail $courierdetail)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Courierdetail $courierdetail)
    {
        //
    }


    public function codex()
    {
        $managerId = Auth::id(); 
         $cdetails = Courierdetail::where('manager_id', $managerId)->get();


         return view('backend.courierdetails.codex',compact('cdetails'));
    }
}
