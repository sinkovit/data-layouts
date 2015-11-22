program type_layouts
  
  !       This program illustrates how various Fortan user defined types
  !       are laid out in memory. Note that a non-optimal ordering of the
  !       elements can result in a larger memory footprint */
  
  integer:: i, s, n=5
  
  type st1
     real*4 :: f1
     real*8 :: d1
     real*4 :: f2
  end type st1
  
  type st2
     real*4 :: f1
     real*4 :: f2
     real*8 :: d1
  end type st2
  
  type st3
     character (len=1) :: c1
     real*4            :: f1
     character (len=1) :: c2
     character (len=1) :: c3
  end type st3
  
  type st4
     real*4            :: f1
     character (len=1) :: c1
     character (len=1) :: c2
     character (len=1) :: c3
  end type st4
  
  type(st1), allocatable :: arr1(:)
  type(st2), allocatable :: arr2(:)
  type(st3), allocatable :: arr3(:)
  type(st4), allocatable :: arr4(:)
  
  allocate(arr1(n), arr2(n), arr3(n), arr4(n))
  
  write(*,*) '--- layout for user defined type (real*4,real*8,real*4) ---'
  s = loc(arr1(1)%f1)
  write(*,"(A,I8)") 'Starting address: ', s
  write(*,*) 'Offsets for elements of array of user defined types'
  do i=1,n
     write(*,"(I5,2x,I5,2x,I5,2x,I5)") i, &
          loc(arr1(i)%f1) - s, &
          loc(arr1(i)%d1) - s, &
          loc(arr1(i)%f2) - s
  enddo
  write(*,*)

  write(*,*) '--- layout for user defined type (real*4,real*4,real*8) ---'
  s = loc(arr2(1)%f1)
  write(*,"(A,I8)") 'Starting address: ', s
  write(*,*) 'Offsets for elements of array of user defined types'
  do i=1,n
     write(*,"(I5,2x,I5,2x,I5,2x,I5)") i, &
          loc(arr2(i)%f1) - s, &
          loc(arr2(i)%f2) - s, &
          loc(arr2(i)%d1) - s
  enddo
  write(*,*)

  write(*,*) '--- layout for user defined type (char,real*4,char,char) ---'
  s = loc(arr3(1)%c1)
  write(*,"(A,I8)") 'Starting address: ', s
  write(*,*) 'Offsets for elements of array of user defined types'
  do i=1,n
     write(*,"(I5,2x,I5,2x,I5,2x,I5,2X,I5)") i, &
          loc(arr3(i)%c1) - s, &
          loc(arr3(i)%f1) - s, &
          loc(arr3(i)%c2) - s, &
          loc(arr3(i)%c3) - s
  enddo
  write(*,*)


  write(*,*) '--- layout for user defined type (real*4,char,char,char) ---'
  s = loc(arr4(1)%f1)
  write(*,"(A,I8)") 'Starting address: ', s
  write(*,*) 'Offsets for elements of array of user defined types'
  do i=1,n
     write(*,"(I5,2x,I5,2x,I5,2x,I5,2X,I5)") i, &
          loc(arr4(i)%f1) - s, &
          loc(arr4(i)%c1) - s, &
          loc(arr4(i)%c2) - s, &
          loc(arr4(i)%c3) - s
  enddo
  write(*,*)
  
  deallocate(arr1, arr2, arr3, arr4)
  
end program type_layouts
