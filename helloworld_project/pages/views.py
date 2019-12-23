from django.shortcuts import render
from django.http import HttpResponse
from helloworld_project.settings import SECRET_WORD
# Create your views here.


def home_page_view(request):
    return HttpResponse('Hello, {0}!'.format(SECRET_WORD))
