<script setup></script>
<template>
  <div class="mx-auto max-w-screen-lg px-4 py-8 sm:px-8">
    <div class="flex items-center justify-between pb-6">
      <div>
        <h2 class="font-semibold text-gray-700">User Accounts</h2>
      </div>
      <div class="flex items-center justify-between">
        <div class="ml-10 space-x-34 lg:ml-40">
          <router-link :to="{ name: 'home' }">
            <button class="mr-2 flex items-center gap-2 rounded-md border-2 px-4 py-2 text-sm font-semibold text-gray-500 sm:inline focus:outline-none focus:ring hover:bg-gray-200">Cancel</button>
          </router-link>
          <button class="hidden flex items-center rounded-md border-2 border-transparent bg-blue-600 px-4 py-2 text-sm font-semibold  text-white sm:inline focus:outline-none focus:ring hover:bg-blue-700">Save</button>
          
        </div>
      </div>
    </div>
    <div class="overflow-y-hidden ">
      <Vueform
    size="md"
    :display-errors="false"
  >
    <StaticElement
      name="register_title"
      content="Create account"
      tag="h1"
    />
    <StaticElement
      name="divider"
      tag="hr"
    />
    <GroupElement
      name="container"
      description="Make sure it matches your legal name"
    >
      <TextElement
        name="first_name"
        placeholder="First name"
        :columns="{
          container: 6,
          label: 12,
          wrapper: 12,
        }"
        field-name="First name"
        :rules="[
          'required',
          'max:255',
        ]"
      />
      <TextElement
        name="last_name"
        placeholder="Last name"
        :columns="{
          container: 6,
          label: 12,
          wrapper: 12,
        }"
        field-name="Last name"
        :rules="[
          'required',
          'max:255',
        ]"
      />
    </GroupElement>
    <DateElement
      name="birthday"
      placeholder="Birthday"
      field-name="Birthday"
      :rules="[
        'required',
      ]"
      description="Your birthday is not visible others."
      display-format="MMMM Do, YYYY"
    />
    <SelectElement
      name="country"
      :search="true"
      :native="false"
      input-type="search"
      autocomplete="disabled"
      placeholder="Country"
      items="/json/countries.json"
    />
    <SelectElement
      name="state"
      :search="true"
      :native="false"
      input-type="search"
      autocomplete="disabled"
      placeholder="State"
      items="/json/states.json"
      :conditions="[
        [
          'country',
          'in',
          [
            'US',
          ],
        ],
      ]"
    />
    <PhoneElement
      name="phone"
      placeholder="Phone"
      :rules="[
        'required',
      ]"
      field-name="Phone"
      :allow-incomplete="true"
      :unmask="true"
    />
    <TextElement
      name="email"
      input-type="email"
      :rules="[
        'required',
        'max:255',
        'email',
      ]"
      placeholder="Email"
      field-name="Email"
      description="You will receive a confirmation letter to this email."
    />
    <TextElement
      name="password"
      input-type="password"
      :rules="[
        'required',
        'min:8',
        'same:password_confirmation',
      ]"
      field-name="Password"
      placeholder="Password"
    />
    <TextElement
      name="password_confirmation"
      input-type="password"
      :rules="[
        'required',
      ]"
      field-name="Password confirmation"
      placeholder="Password again"
    />
    <CheckboxElement
      name="terms"
      text="I accept the Terms & Conditions & Privacy Policy"
    />
    <CheckboxElement
      name="marketing_emails"
      text="I want to recieve marketing emails"
    />
    <StaticElement
      name="divider_1"
      tag="hr"
    />
    <ButtonElement
      name="register"
      :submits="true"
      button-label="Create account"
      :full="true"
      size="lg"
    />
  </Vueform>
    </div>
  </div>
</template>
<style scoped>
  .read-the-docs {
    color: #888;
  }
</style>