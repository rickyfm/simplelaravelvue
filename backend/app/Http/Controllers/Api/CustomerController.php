<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Customer;

class CustomerController extends Controller
{
    public function __construct()
    {
        $this->m_customer  = new Customer;

    }

    public function get(Request $request)
    {
        try {
          $data = [];
          if($request->request->has('id')){
            $id = $request->id;
            $data = $this->m_customer->where('id',$id)->get();
          }else{
            $data = $this->m_customer->all();
          }

          $response = [ 'data' => $data ];

        } catch(\Exception $e){

            $status_code    = $status_code ?? 500;
            $response       = [ 'reason' => $e->getMessage() ];

        }

        $status_code    = $status_code ?? 200;
        $status         = $status_code == 200 ? 'success' : ($status ?? 'error');
        $response       = array_merge([ 'status' => $status ], $response);

        return response()->json($response, $status_code);
    }

    public function save(Request $request)
    {
        if($request->isMethod('post')){

          try {

              $data = $request->request->all();
              $response = [];
              if($request->request->has('id')){
                $id = $request->request->get('id');
                $data['updated_at'] = date('Y-m-d H:i:s');
                $res = $this->m_customer->where('id',$id)->update($data);
              }else{
                $data['created_at'] = date('Y-m-d H:i:s');
                $res = $this->m_customer->upsert($data, ['email'], ['name','address','gender','address','is_married']);
              }

          } catch(\Exception $e){

              $status_code    = $status_code ?? 500;
              $response       = [ 'reason' => $e->getMessage() ];

          }

          $status_code    = $status_code ?? 200;
          $status         = $status_code == 200 ? 'success' : ($status ?? 'error');
          $response       = array_merge([ 'status' => $status ], $response);

          return response()->json($response, $status_code);

        }
    }

    public function delete(Request $request)
    {
        if($request->isMethod('post')){
            try {
              $response = [];
              if($request->request->has('id')){
                $id = $request->request->get('id');
                $res = $this->m_customer->where('id',$id)->forceDelete();
              }

            } catch (\Exception $e) {
              $status_code    = $status_code ?? 500;
              $response       = [ 'reason' => $e->getMessage() ];

            }

            $status_code    = $status_code ?? 200;
            $status         = $status_code == 200 ? 'success' : ($status ?? 'error');
            $response       = array_merge([ 'status' => $status ], $response);

            return response()->json($response, $status_code);

        }
    }
}
