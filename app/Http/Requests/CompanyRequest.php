<?php

namespace App\Http\Requests\Company;

use Illuminate\Foundation\Http\FormRequest;
use Auth;

class CompanyRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            //
            'company' => 'required|max:50',
            'full_name' => 'required|max:50',
            'domain' => 'required|unique:posts',
            'email' => 'required',
            'password' => 'required|min:4'
        ];
    }
    public function messages()
    {
         return [
            'company.required_without'   => 'The company name is required.',
            'full_name.required_without'   => 'The full name is required.',
            'domain.required_without'   => 'The domain name is required.',
            'email.required_without'   => 'The email ID name is required.',
            'password.required_without'   => 'The password is required.',

        ]
    }
    public function withValidator($validator)
    {
        $validator->after(function ($validator) {
            if ($this->somethingElseIsInvalid()) {
                $validator->errors()->add('field', 'Something is wrong with this field!');
            }
        });
    }
}
