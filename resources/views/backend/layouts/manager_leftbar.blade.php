<nav id="primary-nav">
    <ul>
        <li>
            
            <a href="{{ url('manager/dashboard') }}" class="active"><i class="fa fa-fire"></i>Dashboard</a>
        </li>
        <li>
            <a href="{{route('staff.index')}}"><i class="fa fa-glass"></i>All Staff</a>
        </li>
       
        <li>
            <a href="#"><i class="fa fa-th-list"></i>Send Courier List</a>
            <ul>
                <li>
                    <a href="{{ url('employee/codex') }}"><i class="fa fa-file-text"></i>Processing</a>
                </li>
                <li>
                    <a href="page_form_validation.html"><i class="fa fa-exclamation-triangle"></i>Delivered</a>
                </li>
                
            </ul>
        </li>
        
        
</nav>